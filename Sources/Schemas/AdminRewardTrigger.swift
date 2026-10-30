import Foundation

/// A reward trigger as returned from admin endpoints.
public struct AdminRewardTrigger: Codable, Hashable, Sendable {
    /// The UUID of the trigger.
    public let id: String
    /// The type of trigger.
    public let type: AdminRewardTriggerType
    /// The status of the trigger. Only active triggers award the reward.
    public let status: AdminRewardTriggerStatus
    /// User attribute filters applied to the trigger.
    public let userAttributes: [AdminRewardTriggerUserAttributesItem]
    /// The UUID of the metric. Only present for metric triggers.
    public let metricId: String?
    /// The metric threshold. Only present for metric triggers.
    public let metricThreshold: Int?
    /// Event attribute filters applied to the trigger. Only present for metric triggers.
    public let eventAttributes: [AdminRewardTriggerEventAttributesItem]?
    /// The UUID of the achievement. Only present for achievement triggers.
    public let achievementId: String?
    /// The streak length. Only present for streak triggers.
    public let streakLength: Int?
    /// The UUID of the leaderboard. Only present for leaderboard triggers.
    public let leaderboardId: String?
    /// The rank. Only present for leaderboard triggers.
    public let rank: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        type: AdminRewardTriggerType,
        status: AdminRewardTriggerStatus,
        userAttributes: [AdminRewardTriggerUserAttributesItem],
        metricId: String? = nil,
        metricThreshold: Int? = nil,
        eventAttributes: [AdminRewardTriggerEventAttributesItem]? = nil,
        achievementId: String? = nil,
        streakLength: Int? = nil,
        leaderboardId: String? = nil,
        rank: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
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
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(AdminRewardTriggerType.self, forKey: .type)
        self.status = try container.decode(AdminRewardTriggerStatus.self, forKey: .status)
        self.userAttributes = try container.decode([AdminRewardTriggerUserAttributesItem].self, forKey: .userAttributes)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricThreshold = try container.decodeIfPresent(Int.self, forKey: .metricThreshold)
        self.eventAttributes = try container.decodeIfPresent([AdminRewardTriggerEventAttributesItem].self, forKey: .eventAttributes)
        self.achievementId = try container.decodeIfPresent(String.self, forKey: .achievementId)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.leaderboardId = try container.decodeIfPresent(String.self, forKey: .leaderboardId)
        self.rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.userAttributes, forKey: .userAttributes)
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
        case id
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