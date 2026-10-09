import Foundation

public enum UsersPointsEventSummaryRequestAggregation: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case weekly
    case monthly
}