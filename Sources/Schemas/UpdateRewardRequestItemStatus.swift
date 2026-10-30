import Foundation

/// Updated status.
public enum UpdateRewardRequestItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}