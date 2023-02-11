//
//  CountriesViewModel.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import Foundation
import Alamofire

final class CountriesViewModel {
    
    // MARK: Variables
    var coordinator: CountriesCoordinator?
    var cell_id = "CountriesTableViewCell"
    var isRefreshing: ((Bool) -> Void)?
    var didUpdate: (([Countries]) -> Void)?
    var didSelect: ((Countries) -> Void)?
    private(set) var countries: [Countries] = [Countries]() {
        didSet {
            didUpdate?(countries.map { Countries(country: $0) })
        }
    }
    
    func ready() {
        isRefreshing?(true)
        
        ConnectionManager().read(data: countries, endpoint: "countries") { data in
            self.finish(with: data)
        } failure: { error in
            self.failed(with: error)
        }
    }
    
    private func finish(with countries: [Countries]) {
        isRefreshing?(false)
        self.countries = countries
    }
    
    private func failed(with error: AFError) {
        isRefreshing?(false)
    }
    
    func didSelect(at indexPath: IndexPath) {
        if countries.isEmpty { return }
        didSelect?(countries[indexPath.item])
    }
}
