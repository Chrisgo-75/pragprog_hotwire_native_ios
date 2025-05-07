//
//  AppDelegate.swift
//  HikingJournal
//
//  Created by Chris Arndt on 4/17/25.
//

import HotwireNative
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    // This function is the first thing that's called when our app launches, even before SceneDelegate is created.
    // AppDelegate manages the global application and state.
    // SceneDelegate manages each instance, or scene.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Set up path configuration.
        Hotwire.loadPathConfiguration(from: [
            // Below tells hotwire native to fetch this JSON from a remote endpoint, parse the file, and
            // apply rules when app is launched.
            // OLD Rails route: .server(baseURL.appending(path: "configurations/ios_v1.json"))
            .server(baseURL.appending(path: "hotwire/ios/configurations/v1.json"))
        ])
        
        Hotwire.registerBridgeComponents([
            ButtonComponent.self,
            OverflowMenuComponent.self
        ])
        
        // Override point for customization after application launch.
        return true
    }


}

