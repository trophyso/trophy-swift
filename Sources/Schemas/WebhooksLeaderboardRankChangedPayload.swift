import Foundation

public struct WebhooksLeaderboardRankChangedPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: LeaderboardRankChanged
    /// The user whose rank changed.
    public let user: User
    /// The user's leaderboard data that changed.
    public let leaderboard: WebhookUserLeaderboardResponse
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: LeaderboardRankChanged,
        user: User,
        leaderboard: WebhookUserLeaderboardResponse,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.user = user
        self.leaderboard = leaderboard
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(LeaderboardRankChanged.self, forKey: .type)
        self.user = try container.decode(User.self, forKey: .user)
        self.leaderboard = try container.decode(WebhookUserLeaderboardResponse.self, forKey: .leaderboard)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.leaderboard, forKey: .leaderboard)
    }

    public enum LeaderboardRankChanged: String, Codable, Hashable, CaseIterable, Sendable {
        case leaderboardRankChanged = "leaderboard.rank_changed"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case user
        case leaderboard
    }
}