import Foundation

/// What the leaderboard ranks by.
public enum CreateLeaderboardRequestItemRankBy: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case streak
    case points
}