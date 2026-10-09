import Foundation

/// The status of the trigger.
public enum AdminPointsTriggerStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}