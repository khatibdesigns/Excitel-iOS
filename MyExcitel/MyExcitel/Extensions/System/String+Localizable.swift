//
//  String+Localizable.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import Foundation

extension String: Localizable {
    
    public var localized: String {
        let value = NSLocalizedString(self, comment: "")
        if value != self || NSLocale.preferredLanguages.first == "en" {
            return value
        }
        
        guard
            let path = Bundle.main.path(forResource: "en", ofType: "lproj"),
            let bundle = Bundle(path: path)
            else { return value }
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
