//
//  Localization.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import Foundation

public protocol Localizable {
    var localized: String { get }
}

public protocol XIBLocalizable {
    var textKey: String? { get set }
    var hintKey: String? { get set }
}
