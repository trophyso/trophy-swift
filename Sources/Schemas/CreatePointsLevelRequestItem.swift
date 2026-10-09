import Foundation

/// A points level to create.
public struct CreatePointsLevelRequestItem: Codable, Hashable, Sendable {
    /// The name of the level.
    public let name: String
    /// A unique key for the level. Only alphanumeric characters, hyphens, and underscores are permitted.
    public let key: String
    /// The threshold points value for the level.
    public let points: Int
    /// An optional description of the level.
    public let description: String?
    /// An optional badge for the level.
    public let badge: CreatePointsLevelRequestItemBadge?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        key: String,
        points: Int,
        description: String? = nil,
        badge: CreatePointsLevelRequestItemBadge? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.key = key
        self.points = points
        self.description = description
        self.badge = badge
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.points = try container.decode(Int.self, forKey: .points)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.badge = try container.decodeIfPresent(CreatePointsLevelRequestItemBadge.self, forKey: .badge)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.points, forKey: .points)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.badge, forKey: .badge)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case key
        case points
        case description
        case badge
    }
}