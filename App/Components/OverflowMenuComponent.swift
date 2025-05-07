//
//  OverflowMenuComponent.swift
//  HikingJournal
//
//  Created by Chris Arndt on 5/7/25.
//

import Foundation
import HotwireNative
import UIKit

final class OverflowMenuComponent: BridgeComponent {
    override class var name: String { "overflow-menu" }
    private var viewController: UIViewController? {
        delegate.destination as? UIViewController
    }
    
    override func onReceive(message: Message) {
        guard let event = Event(rawValue: message.event) else { return }
        
        switch event {
        case .connect:
            handleConnectEvent(message: message)
        case .disconnect:
            print("disconnect")
        }
    }
    
    private func handleConnectEvent(message: Message) {
        guard let data: MessageData = message.data() else { return }
        guard let viewController else { return }
        
        let actions = buildActions(items: data.items)
        let menu = UIMenu(title: data.label, children: actions)
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), menu: menu)
    }
    
    private func buildActions(items: [Item]) -> [UIAction] {
        return items.map { item in
            UIAction(title: item.title, image: UIImage(systemName: item.ios_icon)) { [unowned self] _ in
                onItemSelected(item: item)
            }
        }
    }
    
    private func onItemSelected(item: Item) {
        reply(to: Event.connect.rawValue, with: SelectedMessageData(selectedIndex: item.index))
    }
}

private extension OverflowMenuComponent {
    enum Event: String {
        case connect
        case disconnect
    }
}

private extension OverflowMenuComponent {
    struct MessageData: Decodable {
        let label: String
        let items: [Item]
    }
        
    struct Item: Decodable {
        let title: String
        let ios_icon: String
        let index: Int
    }
    
    struct SelectedMessageData: Encodable {
        let selectedIndex: Int
    }
}
