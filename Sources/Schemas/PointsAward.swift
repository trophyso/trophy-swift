import Foundation

public struct PointsAward: Codable, Hashable, Sendable {
    /// The ID of the trigger award
    public let id: String?
    /// The points awarded by this trigger
    public let awarded: Int?
    /// The date these points were awarded, in ISO 8601 format.
    public let date: String?
    /// The user's total points after this award occurred.
    public let total: Int?
    public let trigger: PointsTrigger?
    /// Array of points boosts that applied to this award.
    public let boosts: [PointsBoost]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        awarded: Int? = nil,
        date: String? = nil,
        total: Int? = nil,
        trigger: PointsTrigger? = nil,
        boosts: [PointsBoost]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.awarded = awarded
        self.date = date
        self.total = total
        self.trigger = trigger
        self.boosts = boosts
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.awarded = try container.decodeIfPresent(Int.self, forKey: .awarded)
        self.date = try container.decodeIfPresent(String.self, forKey: .date)
        self.total = try container.decodeIfPresent(Int.self, forKey: .total)
        self.trigger = try container.decodeIfPresent(PointsTrigger.self, forKey: .trigger)
        self.boosts = try container.decodeIfPresent([PointsBoost].self, forKey: .boosts)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.awarded, forKey: .awarded)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.total, forKey: .total)
        try container.encodeIfPresent(self.trigger, forKey: .trigger)
        try container.encodeIfPresent(self.boosts, forKey: .boosts)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case awarded
        case date
        case total
        case trigger
        case boosts
    }
}