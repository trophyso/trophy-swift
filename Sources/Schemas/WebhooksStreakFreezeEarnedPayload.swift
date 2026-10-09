import Foundation

public struct WebhooksStreakFreezeEarnedPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: StreakFreezeEarned
    /// The user who earned streak freezes.
    public let user: User
    /// The number of freezes earned.
    public let earned: Int
    /// The total number of freezes the user has after the event.
    public let freezes: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: StreakFreezeEarned,
        user: User,
        earned: Int,
        freezes: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.user = user
        self.earned = earned
        self.freezes = freezes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(StreakFreezeEarned.self, forKey: .type)
        self.user = try container.decode(User.self, forKey: .user)
        self.earned = try container.decode(Int.self, forKey: .earned)
        self.freezes = try container.decode(Int.self, forKey: .freezes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.earned, forKey: .earned)
        try container.encode(self.freezes, forKey: .freezes)
    }

    public enum StreakFreezeEarned: String, Codable, Hashable, CaseIterable, Sendable {
        case streakFreezeEarned = "streak.freeze_earned"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case user
        case earned
        case freezes
    }
}