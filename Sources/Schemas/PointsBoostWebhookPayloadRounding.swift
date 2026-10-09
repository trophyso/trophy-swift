import Foundation

/// The rounding method applied to boosted points.
public enum PointsBoostWebhookPayloadRounding: String, Codable, Hashable, CaseIterable, Sendable {
    case down
    case up
    case nearest
}