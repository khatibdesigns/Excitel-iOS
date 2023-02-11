//
//  CountriesViewController.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import UIKit

class CountriesViewController: UIViewController, Storyboarded {
    
    // MARK: Variables
    var viewModel: CountriesViewModel!
    private var data: [Countries]?
    
    // MARK: Outlets
    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupTableView()
        self.setupViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.ready()
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
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: self.viewModel.cell_id, for: indexPath) as! CountriesTableViewCell
        
        DispatchQueue(label: "com.khd.MyExcitel").async {
            cell.configureCell(data: data[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
