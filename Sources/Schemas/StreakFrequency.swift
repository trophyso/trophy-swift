import Foundation

public enum StreakFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case weekly
    case monthly
}