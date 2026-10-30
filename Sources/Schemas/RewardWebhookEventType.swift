import Foundation

public enum RewardWebhookEventType: String, Codable, Hashable, CaseIterable, Sendable {
    case rewardAwarded = "reward.awarded"
    case rewardRedeemed = "reward.redeemed"
}