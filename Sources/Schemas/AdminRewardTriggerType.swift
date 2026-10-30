import Foundation

/// The type of trigger.
public enum AdminRewardTriggerType: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case achievement
    case streak
    case leaderboard
}