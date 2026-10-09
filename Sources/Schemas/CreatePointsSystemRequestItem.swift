import Foundation

/// A points system to create. Optionally include sub-entities.
public struct CreatePointsSystemRequestItem: Codable, Hashable, Sendable {
    /// The points system name.
    public let name: String
    /// The points system key. Only alphanumeric characters, hyphens, and underscores are permitted.
    public let key: String
    /// A short description of the points system.
    public let description: String?
    /// An optional badge for the points system.
    public let badge: CreatePointsSystemRequestItemBadge?
    /// Optional maximum points a user can earn.
    public let maxPoints: Int?
    /// Optional array of levels to create alongside the system.
    public let levels: [CreatePointsLevelRequestItem]?
    /// Optional array of boosts to create alongside the system.
    public let boosts: [CreatePointsBoostRequestItem]?
    /// Optional array of triggers to create alongside the system.
    public let triggers: [CreatePointsTriggerRequestItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        key: String,
        description: String? = nil,
        badge: CreatePointsSystemRequestItemBadge? = nil,
        maxPoints: Int? = nil,
        levels: [CreatePointsLevelRequestItem]? = nil,
        boosts: [CreatePointsBoostRequestItem]? = nil,
        triggers: [CreatePointsTriggerRequestItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.key = key
        self.description = description
        self.badge = badge
        self.maxPoints = maxPoints
        self.levels = levels
        self.boosts = boosts
        self.triggers = triggers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.badge = try container.decodeIfPresent(CreatePointsSystemRequestItemBadge.self, forKey: .badge)
        self.maxPoints = try container.decodeIfPresent(Int.self, forKey: .maxPoints)
        self.levels = try container.decodeIfPresent([CreatePointsLevelRequestItem].self, forKey: .levels)
        self.boosts = try container.decodeIfPresent([CreatePointsBoostRequestItem].self, forKey: .boosts)
        self.triggers = try container.decodeIfPresent([CreatePointsTriggerRequestItem].self, forKey: .triggers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.badge, forKey: .badge)
        try container.encodeIfPresent(self.maxPoints, forKey: .maxPoints)
        try container.encodeIfPresent(self.levels, forKey: .levels)
        try container.encodeIfPresent(self.boosts, forKey: .boosts)
        try container.encodeIfPresent(self.triggers, forKey: .triggers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case key
        case description
        case badge
        case maxPoints
        case levels
        case boosts
        case triggers
    }
}