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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupViewModel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.ready()
    }
    
    private func setupViewModel() {
        self.viewModel.isRefreshing = { loading in
//            UIApplication.shared.isNetworkActivityIndicatorVisible = loading
        }
        self.viewModel.didUpdate = { [weak self] countries in
            guard let strongSelf = self else { return }
            strongSelf.data = countries
            print("Res: \(countries)")
//            strongSelf.itemsTableView.reloadData()
        }
    }
}
