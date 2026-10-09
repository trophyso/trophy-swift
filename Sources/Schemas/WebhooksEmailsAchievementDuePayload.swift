import Foundation

public struct WebhooksEmailsAchievementDuePayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: EmailsAchievementDue
    /// The time the webhook was sent.
    public let timestamp: Date
    /// The user the achievement message is due for.
    public let user: User
    /// The achievement that was completed.
    public let achievement: UserAchievementResponse
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: EmailsAchievementDue,
        timestamp: Date,
        user: User,
        achievement: UserAchievementResponse,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.timestamp = timestamp
        self.user = user
        self.achievement = achievement
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(EmailsAchievementDue.self, forKey: .type)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.user = try container.decode(User.self, forKey: .user)
        self.achievement = try container.decode(UserAchievementResponse.self, forKey: .achievement)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.achievement, forKey: .achievement)
    }

    public enum EmailsAchievementDue: String, Codable, Hashable, CaseIterable, Sendable {
        case emailsAchievementDue = "emails.achievement_due"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case timestamp
        case user
        case achievement
    }
}