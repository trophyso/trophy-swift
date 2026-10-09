import Foundation

/// The status of the leaderboard.
public enum LeaderboardResponseWithRankingsStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case scheduled
    case finished
}