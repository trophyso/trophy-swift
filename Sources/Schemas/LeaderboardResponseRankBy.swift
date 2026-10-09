import Foundation

/// What the leaderboard ranks by.
public enum LeaderboardResponseRankBy: String, Codable, Hashable, CaseIterable, Sendable {
    case points
    case streak
    case metric
}