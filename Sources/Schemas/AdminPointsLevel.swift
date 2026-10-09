import Foundation

/// A points level as returned from admin endpoints.
public struct AdminPointsLevel: Codable, Hashable, Sendable {
    /// The UUID of the level.
    public let id: String
    /// The name of the level.
    public let name: String
    /// The level key.
    public let key: String
    /// The threshold points value for the level.
    public let points: Int
    /// The level description.
    public let description: String
    /// The badge for the level, or null if no badge is set.
    public let badge: AdminPointsLevelBadge?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        key: String,
        points: Int,
        description: String,
        badge: AdminPointsLevelBadge? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.key = key
        self.points = points
        self.description = description
        self.badge = badge
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.points = try container.decode(Int.self, forKey: .points)
        self.description = try container.decode(String.self, forKey: .description)
        self.badge = try container.decodeIfPresent(AdminPointsLevelBadge.self, forKey: .badge)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.points, forKey: .points)
        try container.encode(self.description, forKey: .description)
        try container.encodeIfPresent(self.badge, forKey: .badge)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case key
        case points
        case description
        case badge
    }
}