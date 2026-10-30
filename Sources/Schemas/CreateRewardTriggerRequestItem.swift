import Foundation

/// A reward trigger to create.
public struct CreateRewardTriggerRequestItem: Codable, Hashable, Sendable {
    /// The type of trigger.
    public let type: CreateRewardTriggerRequestItemType
    /// The status of the trigger. Defaults to 'inactive'.
    public let status: CreateRewardTriggerRequestItemStatus?
    /// Optional user attribute filters for the trigger.
    public let userAttributes: [CreateRewardTriggerRequestItemUserAttributesItem]?
    /// Required if type is `metric`. The UUID of the metric.
    public let metricId: String?
    /// Required if type is `metric`. The reward is awarded each time the user's metric total grows by this amount.
    public let metricThreshold: Int?
    /// Optional event attribute filters. Only permitted if type is `metric`.
    public let eventAttributes: [CreateRewardTriggerRequestItemEventAttributesItem]?
    /// Required if type is `achievement`. The UUID of the achievement.
    public let achievementId: String?
    /// Required if type is `streak`. The number of streak periods that awards the reward. It is awarded again each time the streak grows by this many periods.
    public let streakLength: Int?
    /// Required if type is `leaderboard`. The UUID of the leaderboard.
    public let leaderboardId: String?
    /// Required if type is `leaderboard`. The final rank that awards the reward.
    public let rank: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: CreateRewardTriggerRequestItemType,
        status: CreateRewardTriggerRequestItemStatus? = nil,
        userAttributes: [CreateRewardTriggerRequestItemUserAttributesItem]? = nil,
        metricId: String? = nil,
        metricThreshold: Int? = nil,
        eventAttributes: [CreateRewardTriggerRequestItemEventAttributesItem]? = nil,
        achievementId: String? = nil,
        streakLength: Int? = nil,
        leaderboardId: String? = nil,
        rank: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.status = status
        self.userAttributes = userAttributes
        self.metricId = metricId
        self.metricThreshold = metricThreshold
        self.eventAttributes = eventAttributes
        self.achievementId = achievementId
        self.streakLength = streakLength
        self.leaderboardId = leaderboardId
        self.rank = rank
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(CreateRewardTriggerRequestItemType.self, forKey: .type)
        self.status = try container.decodeIfPresent(CreateRewardTriggerRequestItemStatus.self, forKey: .status)
        self.userAttributes = try container.decodeIfPresent([CreateRewardTriggerRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricThreshold = try container.decodeIfPresent(Int.self, forKey: .metricThreshold)
        self.eventAttributes = try container.decodeIfPresent([CreateRewardTriggerRequestItemEventAttributesItem].self, forKey: .eventAttributes)
        self.achievementId = try container.decodeIfPresent(String.self, forKey: .achievementId)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.leaderboardId = try container.decodeIfPresent(String.self, forKey: .leaderboardId)
        self.rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.metricThreshold, forKey: .metricThreshold)
        try container.encodeIfPresent(self.eventAttributes, forKey: .eventAttributes)
        try container.encodeIfPresent(self.achievementId, forKey: .achievementId)
        try container.encodeIfPresent(self.streakLength, forKey: .streakLength)
        try container.encodeIfPresent(self.leaderboardId, forKey: .leaderboardId)
        try container.encodeIfPresent(self.rank, forKey: .rank)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case status
        case userAttributes
        case metricId
        case metricThreshold
        case eventAttributes
        case achievementId
        case streakLength
        case leaderboardId
        case rank
    }
}