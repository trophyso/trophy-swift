import Foundation

/// The achievement status. Defaults to `inactive`.
public enum CreateAchievementRequestItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case locked
}