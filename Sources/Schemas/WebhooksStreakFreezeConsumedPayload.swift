import Foundation

public struct WebhooksStreakFreezeConsumedPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: StreakFreezeConsumed
    /// The user whose streak freeze was consumed.
    public let user: User
    /// The number of freezes consumed.
    public let consumed: Int
    /// The total number of freezes the user has left after the consumption.
    public let freezes: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: StreakFreezeConsumed,
        user: User,
        consumed: Int,
        freezes: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.user = user
        self.consumed = consumed
        self.freezes = freezes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(StreakFreezeConsumed.self, forKey: .type)
        self.user = try container.decode(User.self, forKey: .user)
        self.consumed = try container.decode(Int.self, forKey: .consumed)
        self.freezes = try container.decode(Int.self, forKey: .freezes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.consumed, forKey: .consumed)
        try container.encode(self.freezes, forKey: .freezes)
    }

    public enum StreakFreezeConsumed: String, Codable, Hashable, CaseIterable, Sendable {
        case streakFreezeConsumed = "streak.freeze_consumed"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case user
        case consumed
        case freezes
    }
}