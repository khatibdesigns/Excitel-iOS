//
//  DetailsViewModel.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import Foundation
import Alamofire

final class DetailsViewModel {
    
    // MARK: Variables
    var coordinator: DetailsCoordinator?
    var didUpdate: ((Countries) -> Void)?
    var country: Countries!
    private(set) var data: Countries! {
        didSet {
            didUpdate?(data)
        }
    }
    
    func ready() {
        self.finish(with: country)
    }
    
    private func finish(with country: Countries) {
        self.data = country
    }
}
