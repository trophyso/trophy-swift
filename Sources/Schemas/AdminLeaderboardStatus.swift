import Foundation

/// The current user-facing status of the leaderboard.
public enum AdminLeaderboardStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case inactive
    case active
    case scheduled
    case finished
}