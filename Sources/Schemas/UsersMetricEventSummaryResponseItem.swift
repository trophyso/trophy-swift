import Foundation

public struct UsersMetricEventSummaryResponseItem: Codable, Hashable, Sendable {
    /// The date of the data point. For weekly or monthly aggregations, this is the first date of the period.
    public let date: String
    /// The user's total for this metric at the end of this date.
    public let total: Double
    /// The change in the user's total for this metric during this period.
    public let change: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: String,
        total: Double,
        change: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.date = date
        self.total = total
        self.change = change
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.total = try container.decode(Double.self, forKey: .total)
        self.change = try container.decode(Double.self, forKey: .change)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.change, forKey: .change)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date
        case total
        case change
    }
}