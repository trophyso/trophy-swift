import Foundation

/// A newly created application API key.
public struct CreatedApplicationKey: Codable, Hashable, Sendable {
    /// The unique identifier of the API key. Use this ID to delete the key.
    public let id: String
    /// The user ID the key is scoped to.
    public let userId: String
    /// The full API key value. This is only returned once at creation time and cannot be retrieved again.
    public let key: String
    /// The key prefix used for cache lookup.
    public let prefix: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        userId: String,
        key: String,
        prefix: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.userId = userId
        self.key = key
        self.prefix = prefix
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.key = try container.decode(String.self, forKey: .key)
        self.prefix = try container.decode(String.self, forKey: .prefix)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.prefix, forKey: .prefix)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case userId
        case key
        case prefix
    }
}