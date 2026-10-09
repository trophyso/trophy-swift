import Foundation

/// The status of the trigger.
public enum PointsTriggerStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case archived
}