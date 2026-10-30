import Foundation

/// Updated type. Changing to `points` requires pointsSystemId and points if the reward has none.
public enum UpdateRewardRequestItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case points
    case custom
}