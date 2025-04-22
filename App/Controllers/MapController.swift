//
//  MapController.swift
//  HikingJournal
//
//  Created by Chris Arndt on 4/22/25.
//

import SwiftUI
import UIKit

class MapController: UIHostingController<MapView> {
    convenience init(url: URL) {
        let viewModel = HikeViewModel(url: url)
        let view = MapView(viewModel: viewModel)
        self.init(rootView: view)
    }
}
