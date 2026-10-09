import Foundation

/// The achievement status.
public enum AdminAchievementStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case locked
}