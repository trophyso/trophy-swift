import Foundation

/// Updated rounding strategy.
public enum PatchPointsBoostsRequestItemRounding: String, Codable, Hashable, CaseIterable, Sendable {
    case down
    case up
    case nearest
}