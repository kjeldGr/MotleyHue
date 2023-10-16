//
//  MHGroup.swift
//
//
//  Created by Kjeld Groot on 01/06/2023.
//

public struct MHGroup: TokenLevel {
    public let keys: [String]
    
    public init(keys: [String]) {
        self.keys = keys
    }
}
