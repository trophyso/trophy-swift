import Foundation

/// The updated metric unit type.
public enum UpdateMetricRequestItemUnitType: String, Codable, Hashable, CaseIterable, Sendable {
    case number
    case currency
}