//
//  MHVariant.swift
//
//
//  Created by Kjeld Groot on 01/06/2023.
//

public struct MHVariant: TokenLevel {
    public let keys: [String]
    
    public init(keys: [String]) {
        self.keys = keys
    }
}

public extension MHVariant {
    static let primary: MHVariant = MHVariant(key: "primary")
    static let secondary: MHVariant = MHVariant(key: "secondary")
    static let tertiary: MHVariant = MHVariant(key: "tertiary")
}
