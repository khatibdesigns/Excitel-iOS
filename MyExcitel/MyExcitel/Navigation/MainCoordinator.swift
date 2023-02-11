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
    
    var window: UIWindow
    var coordinators = [String:Coordinator]()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showCountriesViewController()
    }
    func showCountriesViewController() {
        let countriesCoordinator = CountriesCoordinator(window: window)
        countriesCoordinator.start()
    }
}
