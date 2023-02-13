//
//  UIView.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
