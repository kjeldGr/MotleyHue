//
//  MHElement.swift
//
//
//  Created by Kjeld Groot on 01/06/2023.
//

public struct MHElement: TokenLevel {
    public let keys: [String]
    
    public init(keys: [String]) {
        self.keys = keys
    }
}

public extension MHElement {
    static let border: MHElement = MHElement(key: "border")
    static let indicator: MHElement = MHElement(key: "indicator")
    static let separator: MHElement = MHElement(key: "separator")
    static let title: MHElement = MHElement(key: "title")
    static let subtitle: MHElement = MHElement(key: "subtitle")
    static let description: MHElement = MHElement(key: "description")
    static let icon: MHElement = MHElement(key: "icon")
    static let image: MHElement = MHElement(key: "image")
}
