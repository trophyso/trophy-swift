import Foundation

/// Required if type is `time`. The unit for the time interval.
public enum CreatePointsTriggerRequestItemTimeUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case hours
    case days
}