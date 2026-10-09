import Foundation

/// Notification preferences for each notification type.
public struct NotificationPreferences: Codable, Hashable, Sendable {
    /// Channels to receive achievement completion notifications on.
    public let achievementCompleted: [NotificationChannel]?
    /// Channels to receive recap notifications on.
    public let recap: [NotificationChannel]?
    /// Channels to receive reactivation notifications on.
    public let reactivation: [NotificationChannel]?
    /// Channels to receive streak reminder notifications on.
    public let streakReminder: [NotificationChannel]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        achievementCompleted: [NotificationChannel]? = nil,
        recap: [NotificationChannel]? = nil,
        reactivation: [NotificationChannel]? = nil,
        streakReminder: [NotificationChannel]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.achievementCompleted = achievementCompleted
        self.recap = recap
        self.reactivation = reactivation
        self.streakReminder = streakReminder
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.achievementCompleted = try container.decodeIfPresent([NotificationChannel].self, forKey: .achievementCompleted)
        self.recap = try container.decodeIfPresent([NotificationChannel].self, forKey: .recap)
        self.reactivation = try container.decodeIfPresent([NotificationChannel].self, forKey: .reactivation)
        self.streakReminder = try container.decodeIfPresent([NotificationChannel].self, forKey: .streakReminder)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.achievementCompleted, forKey: .achievementCompleted)
        try container.encodeIfPresent(self.recap, forKey: .recap)
        try container.encodeIfPresent(self.reactivation, forKey: .reactivation)
        try container.encodeIfPresent(self.streakReminder, forKey: .streakReminder)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case achievementCompleted = "achievement_completed"
        case recap
        case reactivation
        case streakReminder = "streak_reminder"
    }
}