import Foundation

/// How boosted points are rounded.
public enum AdminPointsBoostRounding: String, Codable, Hashable, CaseIterable, Sendable {
    case down
    case up
    case nearest
}