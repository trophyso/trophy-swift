import Foundation

public struct WebhooksLeaderboardStartedPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: LeaderboardStarted
    /// The leaderboard run that started and its initial rankings.
    public let leaderboard: LeaderboardResponseWithRankings
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: LeaderboardStarted,
        leaderboard: LeaderboardResponseWithRankings,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.leaderboard = leaderboard
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(LeaderboardStarted.self, forKey: .type)
        self.leaderboard = try container.decode(LeaderboardResponseWithRankings.self, forKey: .leaderboard)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.leaderboard, forKey: .leaderboard)
    }

    public enum LeaderboardStarted: String, Codable, Hashable, CaseIterable, Sendable {
        case leaderboardStarted = "leaderboard.started"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case leaderboard
    }
}