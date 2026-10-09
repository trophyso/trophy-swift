import Foundation

/// A user's year-in-review wrapped data including activity summaries, metrics, points, achievements, streaks, and leaderboard rankings.
public struct WrappedResponse: Codable, Hashable, Sendable {
    /// The user's profile information.
    public let user: User
    /// The user's activity data for the wrapped year.
    public let activity: WrappedActivity
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        user: User,
        activity: WrappedActivity,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.user = user
        self.activity = activity
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.user = try container.decode(User.self, forKey: .user)
        self.activity = try container.decode(WrappedActivity.self, forKey: .activity)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.activity, forKey: .activity)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case user
        case activity
    }
}