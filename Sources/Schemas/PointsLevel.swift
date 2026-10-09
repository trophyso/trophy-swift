import Foundation

/// A level within a points system.
public struct PointsLevel: Codable, Hashable, Sendable {
    /// The ID of the level
    public let id: String
    /// The unique key of the level
    public let key: String
    /// The name of the level
    public let name: String
    /// The description of the level
    public let description: String
    /// The URL of the badge image for the level
    public let badgeUrl: String?
    /// The points threshold required to reach this level
    public let points: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        key: String,
        name: String,
        description: String,
        badgeUrl: String? = nil,
        points: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.key = key
        self.name = name
        self.description = description
        self.badgeUrl = badgeUrl
        self.points = points
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.badgeUrl = try container.decodeIfPresent(String.self, forKey: .badgeUrl)
        self.points = try container.decode(Int.self, forKey: .points)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.description, forKey: .description)
        try container.encodeIfPresent(self.badgeUrl, forKey: .badgeUrl)
        try container.encode(self.points, forKey: .points)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case key
        case name
        case description
        case badgeUrl
        case points
    }
}