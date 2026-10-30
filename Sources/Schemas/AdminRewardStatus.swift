import Foundation

/// The reward status.
public enum AdminRewardStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}