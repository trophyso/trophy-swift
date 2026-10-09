import Foundation

/// The metric unit type.
public enum CreatedMetricUnitType: String, Codable, Hashable, CaseIterable, Sendable {
    case number
    case currency
}