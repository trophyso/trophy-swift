import Foundation

/// The status of the boost.
public enum AdminPointsBoostStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case scheduled
    case finished
}