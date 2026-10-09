import Foundation

/// How progress is displayed in email chart blocks and how often recap messages send.
public enum AdminAggregationPeriod: String, Codable, Hashable, CaseIterable, Sendable {
    case weekly
    case monthly
}