//
//  DetailsViewController.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import UIKit

class DetailsViewController: UIViewController, Storyboarded {

    // MARK: Variables
    var viewModel: DetailsViewModel!
    private var data: Countries?
    
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
        self.viewModel.didUpdate = { [weak self] country in
            guard let strongSelf = self else { return }
            strongSelf.data = country
            strongSelf.title = "\(country.name ?? "")"
        }
    }
}
