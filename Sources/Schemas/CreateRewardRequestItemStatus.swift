import Foundation

/// The status of the reward. Defaults to 'inactive'.
public enum CreateRewardRequestItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}