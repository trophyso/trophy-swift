import Foundation

/// A successfully created metric returned from the create endpoint.
public struct CreatedMetric: Codable, Hashable, Sendable {
    /// The UUID of the created metric.
    public let id: String
    /// The metric name.
    public let name: String
    /// The metric key.
    public let key: String
    /// The metric unit type.
    public let unitType: CreatedMetricUnitType
    /// The stored units value for the metric.
    public let units: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        key: String,
        unitType: CreatedMetricUnitType,
        units: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.key = key
        self.unitType = unitType
        self.units = units
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.unitType = try container.decode(CreatedMetricUnitType.self, forKey: .unitType)
        self.units = try container.decode(String.self, forKey: .units)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.unitType, forKey: .unitType)
        try container.encode(self.units, forKey: .units)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case key
        case unitType
        case units
    }
}