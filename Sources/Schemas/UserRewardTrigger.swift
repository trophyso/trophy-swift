import Foundation

/// The trigger that awarded the reward, as it is configured now. Only the fields for the trigger's current type are included.
public struct UserRewardTrigger: Codable, Hashable, Sendable {
    public let id: String
    public let type: UserRewardTriggerType
    /// For metric triggers, the ID of the metric.
    public let metricId: String?
    /// For metric triggers, the reward is awarded each time the user's total for the metric increases by this amount.
    public let metricThreshold: Int?
    /// For achievement triggers, the ID of the achievement.
    public let achievementId: String?
    /// For streak triggers, the reward is awarded every this many periods of the user's streak.
    public let streakLengthThreshold: Int?
    /// For leaderboard triggers, the ID of the leaderboard.
    public let leaderboardId: String?
    /// For leaderboard triggers, the rank a user must finish a leaderboard run at.
    public let rank: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        type: UserRewardTriggerType,
        metricId: String? = nil,
        metricThreshold: Int? = nil,
        achievementId: String? = nil,
        streakLengthThreshold: Int? = nil,
        leaderboardId: String? = nil,
        rank: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.type = type
        self.metricId = metricId
        self.metricThreshold = metricThreshold
        self.achievementId = achievementId
        self.streakLengthThreshold = streakLengthThreshold
        self.leaderboardId = leaderboardId
        self.rank = rank
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(UserRewardTriggerType.self, forKey: .type)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricThreshold = try container.decodeIfPresent(Int.self, forKey: .metricThreshold)
        self.achievementId = try container.decodeIfPresent(String.self, forKey: .achievementId)
        self.streakLengthThreshold = try container.decodeIfPresent(Int.self, forKey: .streakLengthThreshold)
        self.leaderboardId = try container.decodeIfPresent(String.self, forKey: .leaderboardId)
        self.rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.metricThreshold, forKey: .metricThreshold)
        try container.encodeIfPresent(self.achievementId, forKey: .achievementId)
        try container.encodeIfPresent(self.streakLengthThreshold, forKey: .streakLengthThreshold)
        try container.encodeIfPresent(self.leaderboardId, forKey: .leaderboardId)
        try container.encodeIfPresent(self.rank, forKey: .rank)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case type
        case metricId
        case metricThreshold
        case achievementId
        case streakLengthThreshold
        case leaderboardId
        case rank
    }
}