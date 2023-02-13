//
//  MainCoordinator.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    func start()
    func childDidFinish(_ childCoordinator: Coordinator)
}

extension Coordinator {
    func childDidFinish(_ childCoordinator: Coordinator) {}
}

class MainCoordinator: Coordinator {
    private var navigationController: UINavigationController
    var coordinators = [String:Coordinator]()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showCountriesViewController()
    }
    func showCountriesViewController() {
        let countriesCoordinator = CountriesCoordinator(navigationController: navigationController)
        countriesCoordinator.start()
    }
}
