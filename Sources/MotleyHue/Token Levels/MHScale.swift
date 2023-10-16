//
//  MHScale.swift
//
//
//  Created by Kjeld Groot on 01/06/2023.
//

public struct MHScale: TokenLevel {
    public let keys: [String]
    
    public init(keys: [String]) {
        self.keys = keys
    }
}

public extension MHScale {
    static let extraExtraSmall: MHScale = MHScale(keys: ["xxs", "extraExtraSmall"])
    static let extraSmall: MHScale = MHScale(keys: ["xs", "extraSmall"])
    static let small: MHScale = MHScale(keys: ["s", "small"])
    static let medium: MHScale = MHScale(keys: ["m", "medium"])
    static let large: MHScale = MHScale(keys: ["l", "large"])
    static let extraLarge: MHScale = MHScale(keys: ["xl", "extraLarge"])
    static let extraExtraLarge: MHScale = MHScale(keys: ["xxl", "extraExtraLarge"])
}
