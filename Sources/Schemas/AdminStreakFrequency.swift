import Foundation

/// The frequency at which streaks are calculated.
public enum AdminStreakFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case weekly
    case monthly
}