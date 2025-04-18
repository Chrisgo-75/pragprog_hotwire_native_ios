//
//  Tab.swift
//  HikingJournal
//
//  Created by Chris Arndt on 4/18/25.
//

class Tab {
    init(title: String, image: String, path: String) {
        self.title = title
        self.image = image
        self.path = path
    }
    
    // static give us access to the property at a class-level. Don't need to create an instance to use it.
    static var all = [
        Tab(title: "Hikes", image: "map", path: "hikes"),
        Tab(title: "Hikers", image: "figure.hiking", path: "users")
    ]
    
    let title: String
    let image: String
    let path: String
    
    
}
