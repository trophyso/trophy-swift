import Foundation

/// The achievement trigger type.
public enum AdminAchievementTrigger: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case streak
    case api
    case achievement
    case anniversary
}