import Foundation

/// The type of reward.
public enum AdminRewardType: String, Codable, Hashable, CaseIterable, Sendable {
    case points
    case custom
}