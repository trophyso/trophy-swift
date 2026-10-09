import Foundation

/// An achievement to create. Trigger-specific fields are required based on `trigger`. `status` defaults to `inactive`.
public struct CreateAchievementRequestItem: Codable, Hashable, Sendable {
    /// The achievement name.
    public let name: String
    /// The achievement trigger type.
    public let trigger: CreateAchievementRequestItemTrigger
    /// A short description of the achievement.
    public let description: String?
    /// The achievement status. Defaults to `inactive`.
    public let status: CreateAchievementRequestItemStatus?
    /// An optional badge for the achievement.
    public let badge: CreateAchievementRequestItemBadge?
    /// User attribute filters applied to the achievement. Each `attributeId` must be an active user attribute.
    public let userAttributes: [CreateAchievementRequestItemUserAttributesItem]?
    /// Required if trigger is `api`. Only alphanumeric characters, hyphens, and underscores are permitted.
    public let key: String?
    /// Required if trigger is `metric`. The UUID of the metric.
    public let metricId: String?
    /// Required if trigger is `metric`. The metric threshold users must reach. Must be at least 1.
    public let metricValue: Double?
    /// Event attribute filters. Only permitted for metric achievements. Each `attributeId` must be an active event attribute.
    public let eventAttributes: [CreateAchievementRequestItemEventAttributesItem]?
    /// Required if trigger is `streak`. The streak length users must reach. Must be at least 1.
    public let streakLength: Int?
    /// Required if trigger is `anniversary`. The number of years since sign-up. Must be at least 1.
    public let anniversaryYears: Int?
    /// Required if trigger is `achievement`. UUIDs of prerequisite achievements.
    public let achievementIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        trigger: CreateAchievementRequestItemTrigger,
        description: String? = nil,
        status: CreateAchievementRequestItemStatus? = nil,
        badge: CreateAchievementRequestItemBadge? = nil,
        userAttributes: [CreateAchievementRequestItemUserAttributesItem]? = nil,
        key: String? = nil,
        metricId: String? = nil,
        metricValue: Double? = nil,
        eventAttributes: [CreateAchievementRequestItemEventAttributesItem]? = nil,
        streakLength: Int? = nil,
        anniversaryYears: Int? = nil,
        achievementIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.trigger = trigger
        self.description = description
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
        self.name = try container.decode(String.self, forKey: .name)
        self.trigger = try container.decode(CreateAchievementRequestItemTrigger.self, forKey: .trigger)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.status = try container.decodeIfPresent(CreateAchievementRequestItemStatus.self, forKey: .status)
        self.badge = try container.decodeIfPresent(CreateAchievementRequestItemBadge.self, forKey: .badge)
        self.userAttributes = try container.decodeIfPresent([CreateAchievementRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricValue = try container.decodeIfPresent(Double.self, forKey: .metricValue)
        self.eventAttributes = try container.decodeIfPresent([CreateAchievementRequestItemEventAttributesItem].self, forKey: .eventAttributes)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.anniversaryYears = try container.decodeIfPresent(Int.self, forKey: .anniversaryYears)
        self.achievementIds = try container.decodeIfPresent([String].self, forKey: .achievementIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.trigger, forKey: .trigger)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.badge, forKey: .badge)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
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
        case name
        case trigger
        case description
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