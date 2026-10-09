import Foundation

/// An achievement as returned from admin endpoints. Trigger-specific fields are only present for the matching trigger type.
public struct AdminAchievement: Codable, Hashable, Sendable {
    /// The UUID of the achievement.
    public let id: String
    /// The achievement name.
    public let name: String
    /// A short description of the achievement.
    public let description: String?
    /// The achievement trigger type.
    public let trigger: AdminAchievementTrigger
    /// The achievement status.
    public let status: AdminAchievementStatus
    /// The badge for the achievement, or null if no badge is set.
    public let badge: AdminAchievementBadge?
    /// User attribute filters applied to the achievement.
    public let userAttributes: [AdminAchievementUserAttributesItem]
    /// The achievement key. Only present for API achievements.
    public let key: String?
    /// The UUID of the metric. Only present for metric achievements.
    public let metricId: String?
    /// The metric threshold. Only present for metric achievements.
    public let metricValue: Double?
    /// Event attribute filters. Only present for metric achievements.
    public let eventAttributes: [AdminAchievementEventAttributesItem]?
    /// The streak length. Only present for streak achievements.
    public let streakLength: Int?
    /// The anniversary years. Only present for anniversary achievements.
    public let anniversaryYears: Int?
    /// Prerequisite achievement UUIDs. Only present for achievement achievements.
    public let achievementIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        description: String? = nil,
        trigger: AdminAchievementTrigger,
        status: AdminAchievementStatus,
        badge: AdminAchievementBadge? = nil,
        userAttributes: [AdminAchievementUserAttributesItem],
        key: String? = nil,
        metricId: String? = nil,
        metricValue: Double? = nil,
        eventAttributes: [AdminAchievementEventAttributesItem]? = nil,
        streakLength: Int? = nil,
        anniversaryYears: Int? = nil,
        achievementIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.trigger = trigger
        self.status = status
        self.badge = badge
        self.userAttributes = userAttributes
        self.key = key
        self.metricId = metricId
        self.metricValue = metricValue
        self.eventAttributes = eventAttributes
        self.streakLength = streakLength
        self.anniversaryYears = anniversaryYears
        self.achievementIds = achievementIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.trigger = try container.decode(AdminAchievementTrigger.self, forKey: .trigger)
        self.status = try container.decode(AdminAchievementStatus.self, forKey: .status)
        self.badge = try container.decodeIfPresent(AdminAchievementBadge.self, forKey: .badge)
        self.userAttributes = try container.decode([AdminAchievementUserAttributesItem].self, forKey: .userAttributes)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricValue = try container.decodeIfPresent(Double.self, forKey: .metricValue)
        self.eventAttributes = try container.decodeIfPresent([AdminAchievementEventAttributesItem].self, forKey: .eventAttributes)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.anniversaryYears = try container.decodeIfPresent(Int.self, forKey: .anniversaryYears)
        self.achievementIds = try container.decodeIfPresent([String].self, forKey: .achievementIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.trigger, forKey: .trigger)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.badge, forKey: .badge)
        try container.encode(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.metricValue, forKey: .metricValue)
        try container.encodeIfPresent(self.eventAttributes, forKey: .eventAttributes)
        try container.encodeIfPresent(self.streakLength, forKey: .streakLength)
        try container.encodeIfPresent(self.anniversaryYears, forKey: .anniversaryYears)
        try container.encodeIfPresent(self.achievementIds, forKey: .achievementIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case description
        case trigger
        case status
        case badge
        case userAttributes
        case key
        case metricId
        case metricValue
        case eventAttributes
        case streakLength
        case anniversaryYears
        case achievementIds
    }
}