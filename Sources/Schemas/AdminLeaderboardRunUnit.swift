import Foundation

/// The recurrence unit when the leaderboard repeats.
public enum AdminLeaderboardRunUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case day
    case month
    case year
}