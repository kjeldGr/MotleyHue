//
//  MHCategory.swift
//
//
//  Created by Kjeld Groot on 01/06/2023.
//

public struct MHCategory: TokenLevel {
    public let keys: [String]
    
    public init(keys: [String]) {
        self.keys = keys
    }
}

public extension MHCategory {
    static let color: MHCategory = MHCategory(key: "color")
    static let typography: MHCategory = MHCategory(keys: ["typography", "font"])
    static let spacing: MHCategory = MHCategory(keys: ["spacing", "padding"])
    static let size: MHCategory = MHCategory(keys: ["size", "sizing"])
    static let shadow: MHCategory = MHCategory(key: "shadow")
}
