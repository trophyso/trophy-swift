import Foundation

public struct WebhooksStreakExtendedPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: StreakExtended
    /// The user who extended the streak.
    public let user: User
    /// The streak that was extended.
    public let streak: BaseStreakResponse
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: StreakExtended,
        user: User,
        streak: BaseStreakResponse,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.user = user
        self.streak = streak
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(StreakExtended.self, forKey: .type)
        self.user = try container.decode(User.self, forKey: .user)
        self.streak = try container.decode(BaseStreakResponse.self, forKey: .streak)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.streak, forKey: .streak)
    }

    public enum StreakExtended: String, Codable, Hashable, CaseIterable, Sendable {
        case streakExtended = "streak.extended"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case user
        case streak
    }
}