import Foundation

/// The target user-facing status. `scheduled` activates a leaderboard whose start date is in the future. `finished` behaves like the dashboard finish action.
public enum UpdateLeaderboardRequestItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case inactive
    case active
    case scheduled
    case finished
}