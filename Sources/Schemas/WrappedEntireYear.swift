import Foundation

/// The user's activity data for the entire year.
public struct WrappedEntireYear: Codable, Hashable, Sendable {
    /// The user's metrics during this period, keyed by metric key.
    public let metrics: [String: WrappedMetric]
    /// The user's points during this period, keyed by points system key.
    public let points: [String: WrappedPoints]
    /// Achievements completed during this period.
    public let achievements: [UserAchievementResponse]
    /// The user's best leaderboard rankings during this period, keyed by leaderboard key.
    public let leaderboards: [String: UserLeaderboardResponse]
    /// The user's longest streak during the year.
    public let longestStreak: WrappedStreak
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        metrics: [String: WrappedMetric],
        points: [String: WrappedPoints],
        achievements: [UserAchievementResponse],
        leaderboards: [String: UserLeaderboardResponse],
        longestStreak: WrappedStreak,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.metrics = metrics
        self.points = points
        self.achievements = achievements
        self.leaderboards = leaderboards
        self.longestStreak = longestStreak
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metrics = try container.decode([String: WrappedMetric].self, forKey: .metrics)
        self.points = try container.decode([String: WrappedPoints].self, forKey: .points)
        self.achievements = try container.decode([UserAchievementResponse].self, forKey: .achievements)
        self.leaderboards = try container.decode([String: UserLeaderboardResponse].self, forKey: .leaderboards)
        self.longestStreak = try container.decode(WrappedStreak.self, forKey: .longestStreak)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.metrics, forKey: .metrics)
        try container.encode(self.points, forKey: .points)
        try container.encode(self.achievements, forKey: .achievements)
        try container.encode(self.leaderboards, forKey: .leaderboards)
        try container.encode(self.longestStreak, forKey: .longestStreak)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case metrics
        case points
        case achievements
        case leaderboards
        case longestStreak
    }
}