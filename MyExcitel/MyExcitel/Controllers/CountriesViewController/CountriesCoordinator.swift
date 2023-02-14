//
//  CountriesCoordinator.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import Foundation
import UIKit

final class CountriesCoordinator: Coordinator {
    
   private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = CountriesViewModel()
        let viewController = CountriesViewController.instantiate(storyboard: "Main")
        
        viewController.viewModel = viewModel
        viewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showDetails(_ country: Countries) {
        let coordinator = DetailsCoordinator(navigationController: navigationController, country: country)
        coordinator.start()
    }
}
