//
//  CashedProvider.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import Foundation

class CachedProvider: ProviderProtocol {
    private let provider: ProviderProtocol
    private let cache: CacheStorageProtocol

    init(provider: ProviderProtocol, cache: CacheStorageProtocol) {
        self.provider = provider
        self.cache = cache
    }

    func request<T: Codable>(_ target: Target, completion: @escaping (Result<T, Error>) -> Void) {
        if let cachedResponse: T = cache.getCachedResponse(target) {
            completion(Result<T, Error>.success(cachedResponse))
        }

        provider.request(target) { [weak self] (response: Result<T, Error>) in
            switch response {
            case let .success(model):
                self?.cache.cacheResponse(model, target: target)
            default:
                break
            }

            completion(response)
        }
    }
}
