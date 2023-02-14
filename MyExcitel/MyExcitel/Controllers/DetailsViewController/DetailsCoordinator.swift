//
//  DetailsCoordinator.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import Foundation
import UIKit

final class DetailsCoordinator: Coordinator {
    
   private var navigationController: UINavigationController
   private var country: Countries?
    
    init(navigationController: UINavigationController, country: Countries) {
        self.navigationController = navigationController
        self.country = country
    }
    
    func start() {
        let viewModel = DetailsViewModel()
        viewModel.country = self.country
        let viewController = DetailsViewController.instantiate(storyboard: "Main")
        
        viewController.viewModel = viewModel
        viewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}
