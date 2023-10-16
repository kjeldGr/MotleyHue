//
//  TokenLevel.swift
//  
//
//  Created by Kjeld Groot on 01/06/2023.
//

public protocol TokenLevel: Equatable, Hashable {
    var keys: [String] { get }
    
    init(keys: [String])
}

public extension TokenLevel {
    init(key: String) {
        self.init(keys: [key])
    }
    
    static func +(lhs: Self, rhs: Self) -> Self {
        Self(keys: lhs.keys + rhs.keys)
    }
    
    static func +=(lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }
}

public extension TokenLevel {
    func hash(into hasher: inout Hasher) {
        hasher.combine(keys)
    }
}
