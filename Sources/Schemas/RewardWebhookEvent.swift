import Foundation

public struct RewardWebhookEvent: Codable, Hashable, Sendable {
    public let type: RewardWebhookEventType
    public let timestamp: Date
    public let user: User
    public let reward: RewardSummary
    public let redemption: RewardWebhookEventRedemption
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: RewardWebhookEventType,
        timestamp: Date,
        user: User,
        reward: RewardSummary,
        redemption: RewardWebhookEventRedemption,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.timestamp = timestamp
        self.user = user
        self.reward = reward
        self.redemption = redemption
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(RewardWebhookEventType.self, forKey: .type)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.user = try container.decode(User.self, forKey: .user)
        self.reward = try container.decode(RewardSummary.self, forKey: .reward)
        self.redemption = try container.decode(RewardWebhookEventRedemption.self, forKey: .redemption)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.reward, forKey: .reward)
        try container.encode(self.redemption, forKey: .redemption)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case timestamp
        case user
        case reward
        case redemption
    }
}