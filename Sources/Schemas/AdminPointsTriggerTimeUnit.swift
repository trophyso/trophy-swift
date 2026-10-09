import Foundation

/// The time unit. Only present for time triggers.
public enum AdminPointsTriggerTimeUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case hours
    case days
}