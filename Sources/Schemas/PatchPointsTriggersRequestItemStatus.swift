import Foundation

/// Updated status.
public enum PatchPointsTriggersRequestItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}