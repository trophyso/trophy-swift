import Foundation

/// The status of the leaderboard.
public enum LeaderboardsAllResponseItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case scheduled
    case finished
}