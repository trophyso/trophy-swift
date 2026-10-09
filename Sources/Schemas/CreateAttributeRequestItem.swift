import Foundation

/// An attribute to create.
public struct CreateAttributeRequestItem: Codable, Hashable, Sendable {
    /// The attribute name.
    public let name: String
    /// The attribute key. Only alphanumeric characters, hyphens, and underscores are permitted.
    public let key: String
    /// The attribute type.
    public let type: CreateAttributeRequestItemType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        key: String,
        type: CreateAttributeRequestItemType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.key = key
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.type = try container.decode(CreateAttributeRequestItemType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case key
        case type
    }
}