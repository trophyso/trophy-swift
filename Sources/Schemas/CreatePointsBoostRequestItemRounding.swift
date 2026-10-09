import Foundation

/// How to round the boosted points. Defaults to 'down'.
public enum CreatePointsBoostRequestItemRounding: String, Codable, Hashable, CaseIterable, Sendable {
    case down
    case up
    case nearest
}