import Foundation

public struct WrappedMetricByAttributeValueValue: Codable, Hashable, Sendable {
    /// The name of the metric.
    public let name: String?
    /// The units of the metric.
    public let units: String?
    /// The current total for this attribute value.
    public let currentTotal: Double?
    /// The change during the period for this attribute value.
    public let changeThisPeriod: Double?
    /// The percentage change for this attribute value.
    public let percentChange: Double?
    /// The user's percentile rank for this attribute value during the period.
    public let percentileThisPeriod: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        units: String? = nil,
        currentTotal: Double? = nil,
        changeThisPeriod: Double? = nil,
        percentChange: Double? = nil,
        percentileThisPeriod: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.units = units
        self.currentTotal = currentTotal
        self.changeThisPeriod = changeThisPeriod
        self.percentChange = percentChange
        self.percentileThisPeriod = percentileThisPeriod
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.units = try container.decodeIfPresent(String.self, forKey: .units)
        self.currentTotal = try container.decodeIfPresent(Double.self, forKey: .currentTotal)
        self.changeThisPeriod = try container.decodeIfPresent(Double.self, forKey: .changeThisPeriod)
        self.percentChange = try container.decodeIfPresent(Double.self, forKey: .percentChange)
        self.percentileThisPeriod = try container.decodeIfPresent(Double.self, forKey: .percentileThisPeriod)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.units, forKey: .units)
        try container.encodeIfPresent(self.currentTotal, forKey: .currentTotal)
        try container.encodeIfPresent(self.changeThisPeriod, forKey: .changeThisPeriod)
        try container.encodeIfPresent(self.percentChange, forKey: .percentChange)
        try container.encodeIfPresent(self.percentileThisPeriod, forKey: .percentileThisPeriod)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case units
        case currentTotal
        case changeThisPeriod
        case percentChange
        case percentileThisPeriod
    }
}