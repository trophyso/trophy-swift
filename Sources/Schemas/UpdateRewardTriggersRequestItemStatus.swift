import Foundation

/// Updated status.
public enum UpdateRewardTriggersRequestItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}