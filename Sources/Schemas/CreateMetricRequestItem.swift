import Foundation

/// A metric to create.
public struct CreateMetricRequestItem: Codable, Hashable, Sendable {
    /// The metric name.
    public let name: String
    /// The metric key. Only alphanumeric characters, hyphens, and underscores are permitted.
    public let key: String
    /// The metric unit type. Defaults to `number`.
    public let unitType: CreateMetricRequestItemUnitType?
    /// For `unitType: currency`, this must be a supported `MetricCurrency` code such as `USD`. For `number`, this is an optional freeform unit label.
    public let units: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        key: String,
        unitType: CreateMetricRequestItemUnitType? = nil,
        units: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.key = key
        self.unitType = unitType
        self.units = units
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.unitType = try container.decodeIfPresent(CreateMetricRequestItemUnitType.self, forKey: .unitType)
        self.units = try container.decodeIfPresent(String.self, forKey: .units)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encodeIfPresent(self.unitType, forKey: .unitType)
        try container.encodeIfPresent(self.units, forKey: .units)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case key
        case unitType
        case units
    }
}