import Foundation

/// If the trigger has type 'time', the unit of time after which to award points
public enum PointsTriggerTimeUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case hour
    case day
}