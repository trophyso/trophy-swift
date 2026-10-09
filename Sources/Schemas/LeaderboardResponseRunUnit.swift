import Foundation

/// The repetition type for recurring leaderboards, or null for one-time leaderboards.
public enum LeaderboardResponseRunUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case day
    case month
    case year
}