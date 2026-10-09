import Foundation

/// The updated status.
public enum UpdateAchievementRequestItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case locked
}