//
//  AppDelegate.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 08.05.2021.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let wireframe: WireframeProtocol = Wireframe()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let navigationController = UINavigationController(
            rootViewController: wireframe.buildDateListModule()
        )
        window.rootViewController = navigationController

        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}

