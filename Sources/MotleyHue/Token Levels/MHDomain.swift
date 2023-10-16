//
//  MHDomain.swift
//  
//
//  Created by Kjeld Groot on 01/06/2023.
//

public struct MHDomain: TokenLevel {
    public let keys: [String]
    
    public init(keys: [String]) {
        self.keys = keys
    }
}

public extension MHDomain {
    static let tab: MHDomain = MHDomain(key: "tab")
    static let navigation: MHDomain = MHDomain(key: "navigation")
}
