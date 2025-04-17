//
//  SceneDelegate.swift
//  HikingJournal
//
//  Created by Chris Arndt on 4/17/25.
//

import HotwireNative
import UIKit

// The exclamation point tells the compiler to force unwrap the optional variable, returning a non-optional URL class.
let baseURL = URL(string: "http://localhost:3030")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // Will hold the actual interface that the user sees.
    var window: UIWindow?
    
    // This is a constant variable and private.
    private let navigator = Navigator()
    
    // Required for app to launch.
    // The function being called is our trigger to start rendering some content.
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // For iOS to actually render anything, we need to attach a View Controller to the main window.
        // So grab the rootViewController from Navigator and assign it to the window's root view controller property.
        window?.rootViewController = navigator.rootViewController
        
        // Tell the navigator to render the homepage of the Rails app by calling route(_:)
        navigator.route(baseURL.appending(path: "hikes"))
    }
}
