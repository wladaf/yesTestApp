//
//  Provider.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import Foundation
import Moya

protocol ProviderProtocol: AnyObject {
    func request<T: Codable>(_ target: Target, completion: @escaping (Result<T, Error>) -> Void)
}

class Provider: ProviderProtocol {

    private let provider: MoyaProvider<Target>

    init(provider: MoyaProvider<Target>) {
        self.provider = provider
    }

    func request<T: Codable>(_ target: Target, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(Result<T, Error>.success(model))
                } catch let error {
                    completion(Result<T, Error>.failure(error))
                }
            case let .failure(error):
                completion(Result<T, Error>.failure(error))
            }
        }
    }
}
