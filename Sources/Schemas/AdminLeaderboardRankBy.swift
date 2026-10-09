import Foundation

/// What the leaderboard ranks by.
public enum AdminLeaderboardRankBy: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case streak
    case points
}