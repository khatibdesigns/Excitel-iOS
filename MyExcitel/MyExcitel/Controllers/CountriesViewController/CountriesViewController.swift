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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        SDImageCache.shared.clearMemory()
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
        
        DispatchQueue.global().async {
            cell.configureCell(data: data[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? CountriesTableViewCell {
            SDImageCache.shared.clearMemory()
            cell.iconImageView.sd_cancelCurrentImageLoad()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let scale = min(targetSize.width / image.size.width,
                    targetSize.height / image.size.height)
    
    let size = CGSize(width: image.size.width * scale,
                      height: image.size.height * scale)
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    image.draw(in: CGRect(origin: .zero, size: size))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return scaledImage!
}
