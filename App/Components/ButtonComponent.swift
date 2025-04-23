//
//  ButtonComponent.swift
//  HikingJournal
//
//  Created by Chris Arndt on 4/23/25.
//

import HotwireNative
import UIKit

class ButtonComponent: BridgeComponent {
    // Identify this component as "button", just like on the web (Rails).
    override class var name: String { "button" }
    
    // Add function to receive messages from the Rails Stimulus Controller.
    override func onReceive(message: Message) {
        if message.event == "connect" {
            connect(via: message)
        } else if message.event == "disconnect" {
            disconnect()
        }
    }
    
    private func connect(via message: Message) {
        // The guard statement ensures if the JSON deserialization fails the function will
        // return early and not add a native button.
        guard let data: MessageData = message.data() else { return }
        
        let viewController = delegate.destination as? UIViewController
        let action = UIAction(title: data.title) { _ in
            self.reply(to: message.event)
        }
        let button = UIBarButtonItem(primaryAction: action)
        if let imageName = data.imageName {
            button.image = UIImage(systemName: imageName)
        }
        viewController?.navigationItem.rightBarButtonItem = button
    }
    
    private func disconnect() {
        let viewController = delegate.destination as? UIViewController
        viewController?.navigationItem.rightBarButtonItem = nil
    }
}

// Adding a Struct
private extension ButtonComponent {
    struct MessageData: Decodable {
        let title: String
        // Below is optional. Not all buttons will have an image.
        let imageName: String?
    }
}
