import Foundation

/// A metric update object. `id` is required; `name`, `unitType`, and `units` are optional. `key` cannot be changed through this endpoint.
public struct UpdateMetricRequestItem: Codable, Hashable, Sendable {
    /// The UUID of the metric to update.
    public let id: String
    /// The updated metric name.
    public let name: String?
    /// The updated metric unit type.
    public let unitType: UpdateMetricRequestItemUnitType?
    /// The updated units value. For `unitType: currency`, this must be a supported `MetricCurrency` code such as `USD`.
    public let units: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String? = nil,
        unitType: UpdateMetricRequestItemUnitType? = nil,
        units: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.unitType = unitType
        self.units = units
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.unitType = try container.decodeIfPresent(UpdateMetricRequestItemUnitType.self, forKey: .unitType)
        self.units = try container.decodeIfPresent(String.self, forKey: .units)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.unitType, forKey: .unitType)
        try container.encodeIfPresent(self.units, forKey: .units)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case unitType
        case units
    }
}