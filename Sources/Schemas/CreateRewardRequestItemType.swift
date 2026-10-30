import Foundation

/// The type of reward. `points` rewards grant points when redeemed. `custom` rewards are fulfilled by your own system.
public enum CreateRewardRequestItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case points
    case custom
}