import Foundation

public struct PointsBoost: Codable, Hashable, Sendable {
    /// The ID of the points boost
    public let id: String
    /// The name of the points boost
    public let name: String
    /// The status of the points boost
    public let status: PointsBoostStatus
    /// The start date of the points boost
    public let start: String
    /// The end date of the points boost
    public let end: String?
    /// The multiplier of the points boost
    public let multiplier: Double
    /// The rounding method of the points boost
    public let rounding: PointsBoostRounding
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        status: PointsBoostStatus,
        start: String,
        end: String? = nil,
        multiplier: Double,
        rounding: PointsBoostRounding,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.start = start
        self.end = end
        self.multiplier = multiplier
        self.rounding = rounding
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(PointsBoostStatus.self, forKey: .status)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decodeIfPresent(String.self, forKey: .end)
        self.multiplier = try container.decode(Double.self, forKey: .multiplier)
        self.rounding = try container.decode(PointsBoostRounding.self, forKey: .rounding)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.start, forKey: .start)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encode(self.multiplier, forKey: .multiplier)
        try container.encode(self.rounding, forKey: .rounding)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case status
        case start
        case end
        case multiplier
        case rounding
    }
}