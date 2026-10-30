import Foundation

/// The status of the trigger. Only active triggers award the reward.
public enum AdminRewardTriggerStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}