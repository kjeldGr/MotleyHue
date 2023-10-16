//
//  TokenContainer.swift
//  
//
//  Created by Kjeld Groot on 10/05/2023.
//

public final class TokenContainer<ValueType> {
    
    // MARK: - MissingTokenStrategy
    
    public enum MissingTokenStrategy {
        case none
        case defaultValue(ValueType)
        case assertionFailure(defaultValue: ValueType? = nil)
        case fatalError
    }
    
    // MARK: - Public properties
    
    public let tokens: [String: Any]
    public let missingTokenStrategy: MissingTokenStrategy
    
    // MARK: - Internal properties
    
    private(set) var cache: [String: ValueType?] = [:]
    
    // MARK: - Initializers
    
    public init(
        tokens: [String: Any],
        missingTokenStrategy: MissingTokenStrategy
    ) {
        self.tokens = tokens
        self.missingTokenStrategy = missingTokenStrategy
    }
    
    // MARK: - Public methods
    
    public final func value(for keys: [String]) -> ValueType? {
        let cacheKey = keys.joined(separator: ",")
        if let cachedValue = cache[cacheKey] {
            return cachedValue
        }
        let value: ValueType? = {
            if let value = retrieveValue(for: keys) {
                return value
            } else {
                let message = "No token configuration for \(keys)"
                switch missingTokenStrategy {
                case .none:
                    debugPrint(message)
                    return nil
                case let .defaultValue(defaultValue):
                    debugPrint(message)
                    return defaultValue
                case let .assertionFailure(defaultValue):
                    assertionFailure(message)
                    return defaultValue
                case .fatalError:
                    fatalError(message)
                }
            }
        }()
        cache[cacheKey] = value
        return value
    }
    
    public final func value(for context: DesignContext) -> ValueType? {
        value(for: context.keys)
    }
    
    public func clearCache() {
        cache.removeAll()
    }
    
    // MARK: - Private methods
    
    private func retrieveValue(for keys: [String]) -> ValueType? {
        var tokens = self.tokens
        for key in keys {
            if let token = tokens[key] as? ValueType {
                return token
            } else if let nextLayer = tokens[key] as? [String: Any] {
                tokens = nextLayer
            }
        }
        return keys.count > 1 ? retrieveValue(for: Array(keys.dropFirst())) : nil
    }
}
