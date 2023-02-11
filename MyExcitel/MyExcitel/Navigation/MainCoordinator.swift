//
//  MainCoordinator.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    func start()
    func childDidFinish(_ childCoordinator: Coordinator)
}

extension Coordinator {
    func childDidFinish(_ childCoordinator: Coordinator) {}
}

final class MBMainCoordinator: Coordinator {
    
    func start() {
        
    }
    
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    var appDelegate: AppDelegate
    
    init(window: UIWindow, appDelegate: AppDelegate) {
        self.window = window
        self.appDelegate = appDelegate
    }
    
//    func start() {
//        let coordinator = TabCoordinator(presenter: appDelegate.window!)
//
//        coordinator.parentCoordinator = self
//        childCoordinators.append(coordinator)
//        coordinator.start()
//        coordinator.show(with: .home)
//    }
}
