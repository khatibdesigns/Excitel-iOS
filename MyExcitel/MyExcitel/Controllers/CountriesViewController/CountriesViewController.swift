//
//  CountriesViewController.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import UIKit
import SDWebImage
import SVGKit

class CountriesViewController: UIViewController, Storyboarded {
    
    // MARK: Variables
    var viewModel: CountriesViewModel!
    private var data: [Countries]?
    private var filteredData: [Countries] = [Countries]()
    var isSearch : Bool = false
    
    let searchBar = UISearchBar()
    
    // MARK: Outlets
    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupTableView()
        self.setupSearchBar()
        self.setupViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.ready()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        SDImageCache.shared.clearMemory()
    }
    
    private func setupSearchBar() {
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "\(Strings.TextFields.search)"
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        navigationItem.titleView = searchBar
    }
    
    private func setupViewModel() {
        self.viewModel.isRefreshing = { loading in
            self.showLoading()
        }
        self.viewModel.didUpdate = { [weak self] countries in
            guard let strongSelf = self else { return }
            strongSelf.data = countries
            strongSelf.hideLoading()
            strongSelf.itemsTableView.reloadData()
        }
    }
    private func setupTableView() {
        self.itemsTableView.register(UINib(nibName: "\(viewModel.cell_id)", bundle: nil), forCellReuseIdentifier: "\(viewModel.cell_id)")
        self.itemsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.itemsTableView.delegate = self
        self.itemsTableView.dataSource = self
        self.itemsTableView.reloadData()
    }
}
extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = data else { return 0 }
        
        if isSearch {
            return self.filteredData.count
        }
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.viewModel.cell_id, for: indexPath) as! CountriesTableViewCell
        
        DispatchQueue.global().async {
            if self.isSearch {
                cell.configureCell(data: self.filteredData[indexPath.row])
            }else {
                guard let data = self.data else { return }
                cell.configureCell(data: data[indexPath.row])
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? CountriesTableViewCell {
            SDImageCache.shared.clearMemory()
            cell.iconImageView.sd_cancelCurrentImageLoad()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didSelect(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
extension CountriesViewController: UISearchBarDelegate {
    //MARK: UISearchbar delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            isSearch = false
            self.itemsTableView.reloadData()
        } else if searchText.count >= 3 {
            guard let data = data else { return }
            self.filteredData = data.filter({("\($0.name ?? "")".lowercased().contains(searchText.lowercased()))})
            if(self.filteredData.count == 0) {
                isSearch = false
            } else {
                isSearch = true
            }
            self.itemsTableView.reloadData()
        }
    }
}
