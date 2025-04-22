//
//  HikeViewModel.swift
//  HikingJournal
//
//  Created by Chris Arndt on 4/22/25.
//

import Foundation

@Observable class HikeViewModel {
    // Public, optional property.
    var hike: Hike?
    
    private let url: URL
    
    init(url: URL) {
        self.url = url.appendingPathExtension("json")
    }
    
    // Fetch the JSON, using the shared URLSession to make the network request.
    func fetchCoordinates() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // Parse the JSON and Create a Hike
            hike = try JSONDecoder().decode(Hike.self, from: data)
        } catch {
            print("Failed to fetch hike: \(error.localizedDescription)")
        }
    }
}
