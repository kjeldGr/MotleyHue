//
//  MHProperty.swift
//
//
//  Created by Kjeld Groot on 01/06/2023.
//

public struct MHProperty: TokenLevel {
    public let keys: [String]
    
    public init(keys: [String]) {
        self.keys = keys
    }
}

public extension MHProperty {
    static let text: MHProperty = MHProperty(key: "text")
    static let fontFamily: MHProperty = MHProperty(keys: ["fontFamily", "family"])
    static let fontWeight: MHProperty = MHProperty(keys: ["fontWeight", "weight"])
    static let fontSize: MHProperty = MHProperty(keys: ["fontSize", "size"])
    static let lineHeight: MHProperty = MHProperty(key: "lineHeight")
    static let background: MHProperty = MHProperty(key: "background")
    static let width: MHProperty = MHProperty(key: "width")
    static let height: MHProperty = MHProperty(key: "height")
    static let gap: MHProperty = MHProperty(key: "gap")
    static let horizontal: MHProperty = MHProperty(key: "horizontal")
    static let vertical: MHProperty = MHProperty(key: "vertical")
    static let leading: MHProperty = .horizontal + MHProperty(key: "leading")
    static let trailing: MHProperty = .horizontal + MHProperty(key: "trailing")
    static let top: MHProperty = .vertical + MHProperty(key: "top")
    static let bottom: MHProperty = .vertical + MHProperty(key: "bottom")
    static let cornerRadius: MHProperty = MHProperty(keys: ["cornerRadius", "borderRadius", "radius"])
    static let borderWidth: MHProperty = MHProperty(key: "borderWidth") + .width
}
