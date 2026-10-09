import Foundation

/// The updated trigger type. Changing trigger requires the new trigger's mandatory fields.
public enum UpdateAchievementRequestItemTrigger: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case streak
    case api
    case achievement
    case anniversary
}