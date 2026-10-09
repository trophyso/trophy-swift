import Foundation

/// A points system returned from the creation endpoint. Extends AdminPointsSystem with optional sub-entity arrays that are present when those sub-entities were included in the creation request.
public struct CreatedAdminPointsSystem: Codable, Hashable, Sendable {
    /// The UUID of the points system.
    public let id: String
    /// The points system name.
    public let name: String
    /// The points system key.
    public let key: String
    /// The points system description.
    public let description: String
    /// The points system status.
    public let status: AdminPointsSystemStatus
    /// The badge for the points system.
    public let badge: AdminPointsSystemBadge?
    /// The maximum points a user can earn.
    public let maxPoints: Int?
    /// Levels created alongside the system. Present when levels were provided in the request.
    public let levels: [AdminPointsLevel]?
    /// Boosts created alongside the system. Present when boosts were provided in the request.
    public let boosts: [AdminPointsBoost]?
    /// Triggers created alongside the system. Present when triggers were provided in the request.
    public let triggers: [AdminPointsTrigger]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        key: String,
        description: String,
        status: AdminPointsSystemStatus,
        badge: AdminPointsSystemBadge? = nil,
        maxPoints: Int? = nil,
        levels: [AdminPointsLevel]? = nil,
        boosts: [AdminPointsBoost]? = nil,
        triggers: [AdminPointsTrigger]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.key = key
        self.description = description
        self.status = status
        self.badge = badge
        self.maxPoints = maxPoints
        self.levels = levels
        self.boosts = boosts
        self.triggers = triggers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.description = try container.decode(String.self, forKey: .description)
        self.status = try container.decode(AdminPointsSystemStatus.self, forKey: .status)
        self.badge = try container.decodeIfPresent(AdminPointsSystemBadge.self, forKey: .badge)
        self.maxPoints = try container.decodeIfPresent(Int.self, forKey: .maxPoints)
        self.levels = try container.decodeIfPresent([AdminPointsLevel].self, forKey: .levels)
        self.boosts = try container.decodeIfPresent([AdminPointsBoost].self, forKey: .boosts)
        self.triggers = try container.decodeIfPresent([AdminPointsTrigger].self, forKey: .triggers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.badge, forKey: .badge)
        try container.encodeIfPresent(self.maxPoints, forKey: .maxPoints)
        try container.encodeIfPresent(self.levels, forKey: .levels)
        try container.encodeIfPresent(self.boosts, forKey: .boosts)
        try container.encodeIfPresent(self.triggers, forKey: .triggers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case key
        case description
        case status
        case badge
        case maxPoints
        case levels
        case boosts
        case triggers
    }
}