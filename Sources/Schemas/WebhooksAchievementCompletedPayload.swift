import Foundation

public struct WebhooksAchievementCompletedPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: AchievementCompleted
    /// The user who completed the achievement.
    public let user: User
    /// The achievement completion that occurred.
    public let achievement: UserAchievementResponse
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: AchievementCompleted,
        user: User,
        achievement: UserAchievementResponse,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.user = user
        self.achievement = achievement
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(AchievementCompleted.self, forKey: .type)
        self.user = try container.decode(User.self, forKey: .user)
        self.achievement = try container.decode(UserAchievementResponse.self, forKey: .achievement)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.achievement, forKey: .achievement)
    }

    public enum AchievementCompleted: String, Codable, Hashable, CaseIterable, Sendable {
        case achievementCompleted = "achievement.completed"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case user
        case achievement
    }
}