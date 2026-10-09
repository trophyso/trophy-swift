import Foundation

public struct WebhooksPointsLevelChangedPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: PointsLevelChanged
    /// The user whose level changed.
    public let user: User
    /// The points system in which the level changed.
    public let points: WebhooksPointsLevelChangedPayloadPoints
    /// The user's previous level, or null if the user had no level.
    public let previousLevel: PointsLevel?
    /// The user's new level, or null if the user no longer has a level.
    public let newLevel: PointsLevel?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: PointsLevelChanged,
        user: User,
        points: WebhooksPointsLevelChangedPayloadPoints,
        previousLevel: PointsLevel? = nil,
        newLevel: PointsLevel? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.user = user
        self.points = points
        self.previousLevel = previousLevel
        self.newLevel = newLevel
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(PointsLevelChanged.self, forKey: .type)
        self.user = try container.decode(User.self, forKey: .user)
        self.points = try container.decode(WebhooksPointsLevelChangedPayloadPoints.self, forKey: .points)
        self.previousLevel = try container.decodeIfPresent(PointsLevel.self, forKey: .previousLevel)
        self.newLevel = try container.decodeIfPresent(PointsLevel.self, forKey: .newLevel)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.points, forKey: .points)
        try container.encodeIfPresent(self.previousLevel, forKey: .previousLevel)
        try container.encodeIfPresent(self.newLevel, forKey: .newLevel)
    }

    public enum PointsLevelChanged: String, Codable, Hashable, CaseIterable, Sendable {
        case pointsLevelChanged = "points.level_changed"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case user
        case points
        case previousLevel
        case newLevel
    }
}