//
//  UIViewController.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showLoading() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        for subview in view.subviews {
            if let activityIndicator = subview as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    public func addView(view: UIView, in holder: UIView) {
        holder.subviews.forEach({ $0.removeFromSuperview() })
        view.frame = CGRect(x: 0, y: 0, width: holder.frame.width, height: holder.frame.height)
        view.clipsToBounds = true
        holder.addSubview(view)
    }
}
