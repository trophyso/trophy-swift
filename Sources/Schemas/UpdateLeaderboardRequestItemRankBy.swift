import Foundation

/// The updated ranking criterion. This can only be changed while the leaderboard is inactive.
public enum UpdateLeaderboardRequestItemRankBy: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case streak
    case points
}