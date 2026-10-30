import Foundation

/// Updated trigger type. Can only be changed when the trigger is inactive. Required fields for the new type must be provided.
public enum UpdateRewardTriggersRequestItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case achievement
    case streak
    case leaderboard
}