import Foundation

public enum UserRewardTriggerType: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case achievement
    case streak
    case leaderboard
}