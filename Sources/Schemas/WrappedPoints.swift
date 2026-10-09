import Foundation

/// A user's points data for a wrapped period.
public struct WrappedPoints: Codable, Hashable, Sendable {
    /// The name of the points system.
    public let name: String
    /// The description of the points system.
    public let description: String?
    /// The user's current total points.
    public let currentTotal: Double
    /// The change in points during the period.
    public let changeThisPeriod: Double
    /// The percentage change in points during the period.
    public let percentChange: Double
    /// The user's percentile rank for this points system during the period. Only included for weekly, monthly, and yearly aggregation periods.
    public let percentileThisPeriod: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        description: String? = nil,
        currentTotal: Double,
        changeThisPeriod: Double,
        percentChange: Double,
        percentileThisPeriod: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.description = description
        self.currentTotal = currentTotal
        self.changeThisPeriod = changeThisPeriod
        self.percentChange = percentChange
        self.percentileThisPeriod = percentileThisPeriod
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.currentTotal = try container.decode(Double.self, forKey: .currentTotal)
        self.changeThisPeriod = try container.decode(Double.self, forKey: .changeThisPeriod)
        self.percentChange = try container.decode(Double.self, forKey: .percentChange)
        self.percentileThisPeriod = try container.decodeIfPresent(Double.self, forKey: .percentileThisPeriod)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.currentTotal, forKey: .currentTotal)
        try container.encode(self.changeThisPeriod, forKey: .changeThisPeriod)
        try container.encode(self.percentChange, forKey: .percentChange)
        try container.encodeIfPresent(self.percentileThisPeriod, forKey: .percentileThisPeriod)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case description
        case currentTotal
        case changeThisPeriod
        case percentChange
        case percentileThisPeriod
    }
}