import Foundation

/// Updated time unit. Only permitted for time triggers.
public enum PatchPointsTriggersRequestItemTimeUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case hours
    case days
}