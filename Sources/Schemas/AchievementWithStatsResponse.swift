import Foundation

public struct AchievementWithStatsResponse: Codable, Hashable, Sendable {
    /// The unique ID of the achievement.
    public let id: String
    /// The name of this achievement.
    public let name: String
    /// The trigger of the achievement.
    public let trigger: AchievementResponseTrigger
    /// The description of this achievement.
    public let description: String?
    /// The URL of the badge image for the achievement, if one has been uploaded.
    public let badgeUrl: String?
    /// The key used to reference this achievement in the API (only applicable if trigger = 'api')
    public let key: String?
    /// The length of the streak required to complete the achievement (only applicable if trigger = 'streak')
    public let streakLength: Int?
    /// The number of years after sign-up required to complete the achievement (only applicable if trigger = 'anniversary')
    public let anniversaryYears: Int?
    /// The IDs of the prerequisite achievements that must be completed to earn this achievement (only applicable if trigger = 'achievement')
    public let achievementIds: [String]?
    /// The ID of the metric associated with this achievement (only applicable if trigger = 'metric')
    public let metricId: String?
    /// The value of the metric required to complete the achievement (only applicable if trigger = 'metric')
    public let metricValue: Double?
    /// The name of the metric associated with this achievement (only applicable if trigger = 'metric')
    public let metricName: String?
    /// User attribute filters that must be met for this achievement to be completed.
    public let userAttributes: [AchievementResponseUserAttributesItem]
    /// Deprecated. Event attribute filter that must be met for this achievement to be completed. Only present if the achievement has an event filter configured.
    public let eventAttribute: AchievementResponseEventAttribute?
    /// Event attribute filters that must be met for this achievement to be completed. Omitted for non-metric achievements.
    public let eventAttributes: [AchievementResponseEventAttributesItem]?
    /// The number of users who have completed this achievement.
    public let completions: Int
    /// The percentage of all users who have completed this achievement.
    public let rarity: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        trigger: AchievementResponseTrigger,
        description: String? = nil,
        badgeUrl: String? = nil,
        key: String? = nil,
        streakLength: Int? = nil,
        anniversaryYears: Int? = nil,
        achievementIds: [String]? = nil,
        metricId: String? = nil,
        metricValue: Double? = nil,
        metricName: String? = nil,
        userAttributes: [AchievementResponseUserAttributesItem],
        eventAttribute: AchievementResponseEventAttribute? = nil,
        eventAttributes: [AchievementResponseEventAttributesItem]? = nil,
        completions: Int,
        rarity: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.trigger = trigger
        self.description = description
        self.badgeUrl = badgeUrl
        self.key = key
        self.streakLength = streakLength
        self.anniversaryYears = anniversaryYears
        self.achievementIds = achievementIds
        self.metricId = metricId
        self.metricValue = metricValue
        self.metricName = metricName
        self.userAttributes = userAttributes
        self.eventAttribute = eventAttribute
        self.eventAttributes = eventAttributes
        self.completions = completions
        self.rarity = rarity
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.trigger = try container.decode(AchievementResponseTrigger.self, forKey: .trigger)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.badgeUrl = try container.decodeIfPresent(String.self, forKey: .badgeUrl)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.anniversaryYears = try container.decodeIfPresent(Int.self, forKey: .anniversaryYears)
        self.achievementIds = try container.decodeIfPresent([String].self, forKey: .achievementIds)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricValue = try container.decodeIfPresent(Double.self, forKey: .metricValue)
        self.metricName = try container.decodeIfPresent(String.self, forKey: .metricName)
        self.userAttributes = try container.decode([AchievementResponseUserAttributesItem].self, forKey: .userAttributes)
        self.eventAttribute = try container.decodeIfPresent(AchievementResponseEventAttribute.self, forKey: .eventAttribute)
        self.eventAttributes = try container.decodeIfPresent([AchievementResponseEventAttributesItem].self, forKey: .eventAttributes)
        self.completions = try container.decode(Int.self, forKey: .completions)
        self.rarity = try container.decode(Double.self, forKey: .rarity)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.trigger, forKey: .trigger)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.badgeUrl, forKey: .badgeUrl)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.streakLength, forKey: .streakLength)
        try container.encodeIfPresent(self.anniversaryYears, forKey: .anniversaryYears)
        try container.encodeIfPresent(self.achievementIds, forKey: .achievementIds)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.metricValue, forKey: .metricValue)
        try container.encodeIfPresent(self.metricName, forKey: .metricName)
        try container.encode(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.eventAttribute, forKey: .eventAttribute)
        try container.encodeIfPresent(self.eventAttributes, forKey: .eventAttributes)
        try container.encode(self.completions, forKey: .completions)
        try container.encode(self.rarity, forKey: .rarity)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case trigger
        case description
        case badgeUrl
        case key
        case streakLength
        case anniversaryYears
        case achievementIds
        case metricId
        case metricValue
        case metricName
        case userAttributes
        case eventAttribute
        case eventAttributes
        case completions
        case rarity
    }
}