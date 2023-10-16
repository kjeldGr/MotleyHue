//
//  MHComponent.swift
//
//
//  Created by Kjeld Groot on 01/06/2023.
//

public struct MHComponent: TokenLevel {
    public let keys: [String]
    
    public init(keys: [String]) {
        self.keys = keys
    }
}

public extension MHComponent {
    static let bar: MHComponent = MHComponent(key: "bar")
    static let button: MHComponent = MHComponent(key: "button")
    static let textField: MHComponent = MHComponent(key: "textField")
    static let list: MHComponent = MHComponent(key: "list")
    static let item: MHComponent = MHComponent(key: "item")
}
