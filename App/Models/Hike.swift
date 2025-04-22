//
//  Hike.swift
//  HikingJournal
//
//  Created by Chris Arndt on 4/22/25.
//

import MapKit

struct Hike: Decodable {
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
