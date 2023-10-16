//
//  MHState.swift
//
//
//  Created by Kjeld Groot on 01/06/2023.
//

public struct MHState: TokenLevel {
    public let keys: [String]
    
    public init(keys: [String]) {
        self.keys = keys
    }
}

public extension MHState {
    static let `default`: MHState = MHState(key: "default")
    static let highlighted: MHState = MHState(keys: ["highlighted", "active"])
    static let disabled: MHState = MHState(key: "disabled")
    static let selected: MHState = MHState(key: "selected") + .highlighted
}
