import Foundation

/// The status of the pause.
public enum AdminStreakPauseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case archived
}