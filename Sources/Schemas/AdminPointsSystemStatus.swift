import Foundation

/// The points system status.
public enum AdminPointsSystemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case archived
}