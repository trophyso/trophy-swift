import Foundation

public struct RedeemRewardResponse: Codable, Hashable, Sendable {
    public let reward: RewardSummary
    /// The awards redeemed by this request, oldest first.
    public let redemptions: [RedeemedReward]
    /// Points granted by a points reward, keyed by points system key. Includes one award per redemption.
    public let points: [String: MetricEventPointsResponse]?
    /// A map of leaderboards by key. Only contains leaderboards that were affected by the points this request granted.
    public let leaderboards: [String: MetricEventLeaderboardResponse]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        reward: RewardSummary,
        redemptions: [RedeemedReward],
        points: [String: MetricEventPointsResponse]? = nil,
        leaderboards: [String: MetricEventLeaderboardResponse],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.reward = reward
        self.redemptions = redemptions
        self.points = points
        self.leaderboards = leaderboards
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.reward = try container.decode(RewardSummary.self, forKey: .reward)
        self.redemptions = try container.decode([RedeemedReward].self, forKey: .redemptions)
        self.points = try container.decodeIfPresent([String: MetricEventPointsResponse].self, forKey: .points)
        self.leaderboards = try container.decode([String: MetricEventLeaderboardResponse].self, forKey: .leaderboards)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.reward, forKey: .reward)
        try container.encode(self.redemptions, forKey: .redemptions)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encode(self.leaderboards, forKey: .leaderboards)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case reward
        case redemptions
        case points
        case leaderboards
    }
}