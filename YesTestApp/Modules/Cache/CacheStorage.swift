//
//  CaseStorage.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import Foundation

protocol CacheStorageProtocol: AnyObject {
    func getCachedResponse<T: Codable>(_ target: Target) -> T?
    func cacheResponse<T: Codable>(_ response: T, target: Target)
}

class CacheStorage: CacheStorageProtocol {
    private let defaults = UserDefaults.standard

    func getCachedResponse<T: Codable>(_ target: Target) -> T? {
        if let data = defaults.object(forKey: key(from: target)) as? Data {
            let decoder = JSONDecoder()
            if let response = try? decoder.decode(T.self, from: data) {
                return response
            }
        }

        return nil
    }

    func cacheResponse<T: Codable>(_ response: T, target: Target) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(response) {
            defaults.set(encoded, forKey: key(from: target))
        }
    }

    private func key(from target: Target) -> String {
        target.path
    }
}
