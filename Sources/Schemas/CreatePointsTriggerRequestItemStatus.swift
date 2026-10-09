import Foundation

/// The status of the trigger. Defaults to 'inactive'.
public enum CreatePointsTriggerRequestItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}