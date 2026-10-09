import Foundation

/// The initial user-facing status. Defaults to `inactive`. Use `scheduled` for leaderboards that should be active in the future and `finished` only when creating a leaderboard with an end date in the past.
public enum CreateLeaderboardRequestItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case inactive
    case active
    case scheduled
    case finished
}