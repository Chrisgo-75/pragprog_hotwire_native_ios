//
//  TabBarController.swift
//  HikingJournal
//
//  Created by Chris Arndt on 4/18/25.
//

import HotwireNative
import UIKit

class TabBarController: UITabBarController {
    private var navigators = [Navigator]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = makeViewControllers()
    }
    
    private func makeViewControllers() -> [UIViewController] {
        return Tab.all.map { tab in
            let navigator = Navigator()
            navigator.route(baseURL.appending(path: tab.path))
            navigators.append(navigator)
            
            let controller = navigator.rootViewController
            controller.tabBarItem.title = tab.title
            controller.tabBarItem.image = UIImage(systemName: tab.image)
            return controller
        }
    }
}
