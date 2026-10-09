import Foundation

/// The achievement trigger type.
public enum CreateAchievementRequestItemTrigger: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case streak
    case api
    case achievement
    case anniversary
}