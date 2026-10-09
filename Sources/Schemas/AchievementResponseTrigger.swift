import Foundation

/// The trigger of the achievement.
public enum AchievementResponseTrigger: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case streak
    case api
    case achievement
    case anniversary
}