//
//  Wireframe.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import Foundation
import Moya

protocol WireframeProtocol {
    func buildDateListModule() -> DateListViewController
    func buildDateDetailsModule(dateDetails: DateDetails) -> DateDetailsViewController

    func buildCachedProvider() -> ProviderProtocol
    func buildProvider() -> ProviderProtocol
    func buildCacheStorage() -> CacheStorageProtocol
}

class Wireframe: WireframeProtocol {
    private var provider: ProviderProtocol?
    private var cachedProvider: ProviderProtocol?
    private var cacheStorage: CacheStorageProtocol?

    func buildDateListModule() -> DateListViewController {
        DateListViewController(
            provider: buildCachedProvider(),
            wireframe: self
        )
    }

    func buildDateDetailsModule(dateDetails: DateDetails) -> DateDetailsViewController {
        DateDetailsViewController(dateDetails: dateDetails)
    }

    func buildCachedProvider() -> ProviderProtocol {
        if let cachedProvider = cachedProvider {
            return cachedProvider
        }

        let cachedProvider = CachedProvider(
            provider: buildProvider(),
            cache: buildCacheStorage()
        )
        self.cachedProvider = cachedProvider
        return cachedProvider
    }

    func buildProvider() -> ProviderProtocol {
        if let provider = provider {
            return provider
        }

        let provider = Provider(
            provider: MoyaProvider<Target>()
        )
        self.provider = provider
        return provider
    }

    func buildCacheStorage() -> CacheStorageProtocol {
        if let cacheStorage = cacheStorage {
            return cacheStorage
        }

        let cacheStorage = CacheStorage()
        self.cacheStorage = cacheStorage
        return cacheStorage
    }
}
