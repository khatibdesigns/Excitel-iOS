//
//  ConnectionManager.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import Foundation
import Alamofire

class ConnectionManager {
    private var baseURL = ""
    
    // MARK: - Read methods
    
    func read<T: Decodable>(data: T, endpoint: String, method: HTTPMethod = .get, headers: [String:String] = ["Content-Type": "application/json"], completion: @escaping (T) -> Void, failure: @escaping(AFError)-> Void) {
        AF.request("\(baseURL + endpoint)", method: method, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).responseDecodable(of: T.self) { (response) in
            switch response.result {
            case .success:
                if let result = response.value {
                    completion(result)
                }
            case let .failure(error):
                failure(error)
            }
        }
    }
}
