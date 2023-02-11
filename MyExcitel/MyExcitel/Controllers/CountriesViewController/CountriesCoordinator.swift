//
//  CountriesCoordinator.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import Foundation
import UIKit

final class CountriesCoordinator: Coordinator {
    
   private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = CountriesViewController.instantiate(storyboard: "Main")
        let viewModel = CountriesViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        window.rootViewController = viewController
    }
}
