import Foundation

/// The status of the points boost
public enum PointsBoostStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case scheduled
    case finished
}