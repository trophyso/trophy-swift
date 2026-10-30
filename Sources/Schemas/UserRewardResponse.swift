import Foundation

public struct UserRewardResponse: Codable, Hashable, Sendable {
    /// The ID of the reward redemption.
    public let id: String
    public let awardedAt: Date
    public let redeemed: Bool
    public let redeemedAt: Date?
    public let reward: RewardSummary
    public let trigger: UserRewardTrigger?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        awardedAt: Date,
        redeemed: Bool,
        redeemedAt: Date? = nil,
        reward: RewardSummary,
        trigger: UserRewardTrigger? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.awardedAt = awardedAt
        self.redeemed = redeemed
        self.redeemedAt = redeemedAt
        self.reward = reward
        self.trigger = trigger
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.awardedAt = try container.decode(Date.self, forKey: .awardedAt)
        self.redeemed = try container.decode(Bool.self, forKey: .redeemed)
        self.redeemedAt = try container.decodeIfPresent(Date.self, forKey: .redeemedAt)
        self.reward = try container.decode(RewardSummary.self, forKey: .reward)
        self.trigger = try container.decodeIfPresent(UserRewardTrigger.self, forKey: .trigger)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.awardedAt, forKey: .awardedAt)
        try container.encode(self.redeemed, forKey: .redeemed)
        try container.encodeIfPresent(self.redeemedAt, forKey: .redeemedAt)
        try container.encode(self.reward, forKey: .reward)
        try container.encodeIfPresent(self.trigger, forKey: .trigger)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case awardedAt
        case redeemed
        case redeemedAt
        case reward
        case trigger
    }
}