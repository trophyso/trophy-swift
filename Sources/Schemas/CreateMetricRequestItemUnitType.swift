import Foundation

/// The metric unit type. Defaults to `number`.
public enum CreateMetricRequestItemUnitType: String, Codable, Hashable, CaseIterable, Sendable {
    case number
    case currency
}