import Foundation

public enum UsersMetricEventSummaryRequestAggregation: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case weekly
    case monthly
}