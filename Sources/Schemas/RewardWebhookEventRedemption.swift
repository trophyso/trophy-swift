import Foundation

public struct RewardWebhookEventRedemption: Codable, Hashable, Sendable {
    public let id: String
    public let redeemed: Bool
    public let awardedAt: Date
    public let redeemedAt: Date?
    public let trigger: UserRewardTrigger?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        redeemed: Bool,
        awardedAt: Date,
        redeemedAt: Date? = nil,
        trigger: UserRewardTrigger? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.redeemed = redeemed
        self.awardedAt = awardedAt
        self.redeemedAt = redeemedAt
        self.trigger = trigger
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.redeemed = try container.decode(Bool.self, forKey: .redeemed)
        self.awardedAt = try container.decode(Date.self, forKey: .awardedAt)
        self.redeemedAt = try container.decodeIfPresent(Date.self, forKey: .redeemedAt)
        self.trigger = try container.decodeIfPresent(UserRewardTrigger.self, forKey: .trigger)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.redeemed, forKey: .redeemed)
        try container.encode(self.awardedAt, forKey: .awardedAt)
        try container.encodeIfPresent(self.redeemedAt, forKey: .redeemedAt)
        try container.encodeIfPresent(self.trigger, forKey: .trigger)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case redeemed
        case awardedAt
        case redeemedAt
        case trigger
    }
}