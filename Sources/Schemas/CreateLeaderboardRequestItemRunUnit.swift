import Foundation

/// How often the leaderboard repeats. Omit for a non-recurring leaderboard. Streak leaderboards cannot repeat.
public enum CreateLeaderboardRequestItemRunUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case day
    case month
    case year
}