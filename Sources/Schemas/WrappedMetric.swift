import Foundation

/// A user's metric data for a wrapped period.
public struct WrappedMetric: Codable, Hashable, Sendable {
    /// The name of the metric.
    public let name: String
    /// The units of the metric.
    public let units: String?
    /// The user's current total for the metric.
    public let currentTotal: Double
    /// The change in the metric value during the period.
    public let changeThisPeriod: Double
    /// The percentage change in the metric value during the period.
    public let percentChange: Double
    /// The user's percentile rank for this metric during the period. Only included for weekly, monthly, and yearly aggregation periods.
    public let percentileThisPeriod: Double?
    /// Metric data broken down by attribute key and value.
    public let byAttribute: [String: [String: WrappedMetricByAttributeValueValue]]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        units: String? = nil,
        currentTotal: Double,
        changeThisPeriod: Double,
        percentChange: Double,
        percentileThisPeriod: Double? = nil,
        byAttribute: [String: [String: WrappedMetricByAttributeValueValue]],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.units = units
        self.currentTotal = currentTotal
        self.changeThisPeriod = changeThisPeriod
        self.percentChange = percentChange
        self.percentileThisPeriod = percentileThisPeriod
        self.byAttribute = byAttribute
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.units = try container.decodeIfPresent(String.self, forKey: .units)
        self.currentTotal = try container.decode(Double.self, forKey: .currentTotal)
        self.changeThisPeriod = try container.decode(Double.self, forKey: .changeThisPeriod)
        self.percentChange = try container.decode(Double.self, forKey: .percentChange)
        self.percentileThisPeriod = try container.decodeIfPresent(Double.self, forKey: .percentileThisPeriod)
        self.byAttribute = try container.decode([String: [String: WrappedMetricByAttributeValueValue]].self, forKey: .byAttribute)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.units, forKey: .units)
        try container.encode(self.currentTotal, forKey: .currentTotal)
        try container.encode(self.changeThisPeriod, forKey: .changeThisPeriod)
        try container.encode(self.percentChange, forKey: .percentChange)
        try container.encodeIfPresent(self.percentileThisPeriod, forKey: .percentileThisPeriod)
        try container.encode(self.byAttribute, forKey: .byAttribute)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case units
        case currentTotal
        case changeThisPeriod
        case percentChange
        case percentileThisPeriod
        case byAttribute
    }
}