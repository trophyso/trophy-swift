import Foundation

public struct CreateAchievementRequestItemEventAttributesItem: Codable, Hashable, Sendable {
    public let attributeId: String
    public let attributeValue: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        attributeId: String,
        attributeValue: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.attributeId = attributeId
        self.attributeValue = attributeValue
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributeId = try container.decode(String.self, forKey: .attributeId)
        self.attributeValue = try container.decode(String.self, forKey: .attributeValue)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.attributeId, forKey: .attributeId)
        try container.encode(self.attributeValue, forKey: .attributeValue)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case attributeId
        case attributeValue
    }
}