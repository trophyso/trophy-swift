import Foundation

/// The rounding method of the points boost
public enum PointsBoostRounding: String, Codable, Hashable, CaseIterable, Sendable {
    case down
    case up
    case nearest
}