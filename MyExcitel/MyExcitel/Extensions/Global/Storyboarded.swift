//
//  Storyboarded.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import Foundation
import UIKit

protocol Storyboarded { }

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboard: String) -> Self {
        let storyboardIdentifier = String(describing: self)
        let storyboard = UIStoryboard(name: "\(storyboard)", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
