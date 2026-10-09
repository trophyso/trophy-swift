import Foundation

public struct WebhooksEmailsStreakReminderDuePayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: EmailsStreakReminderDue
    /// The time the webhook was sent.
    public let timestamp: Date
    /// The user the streak reminder is due for.
    public let user: User
    /// The user's current streak data.
    public let streak: StreakResponse
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: EmailsStreakReminderDue,
        timestamp: Date,
        user: User,
        streak: StreakResponse,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.timestamp = timestamp
        self.user = user
        self.streak = streak
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(EmailsStreakReminderDue.self, forKey: .type)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.user = try container.decode(User.self, forKey: .user)
        self.streak = try container.decode(StreakResponse.self, forKey: .streak)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.streak, forKey: .streak)
    }

    public enum EmailsStreakReminderDue: String, Codable, Hashable, CaseIterable, Sendable {
        case emailsStreakReminderDue = "emails.streak_reminder_due"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case timestamp
        case user
        case streak
    }
}