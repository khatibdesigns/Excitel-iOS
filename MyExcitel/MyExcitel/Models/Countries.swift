//
//  Countries.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import Foundation

struct CountriesItemViewModel {
    let capitalName: String?
    let code: String?
    let flag: String?
    let latLng: [Double]?
    let name: String?
    let population: Int?
    let region: String?
    let subregion: String?
}

struct Countries: Encodable, Decodable {
    let capitalName: String?
    let code: String?
    let flag: String?
    let latLng: [Double]?
    let name: String?
    let population: Int?
    let region: String?
    let subregion: String?
}

extension Countries {
    init(country: Countries) {
        self.capitalName = country.capitalName
        self.code = country.code
        self.flag = country.flag
        self.latLng = country.latLng
        self.name = country.name
        self.population = country.population
        self.region = country.region
        self.subregion = country.subregion
    }
}
