import Foundation

/// The status of the points boost.
public enum PointsBoostWebhookPayloadStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case finished
}