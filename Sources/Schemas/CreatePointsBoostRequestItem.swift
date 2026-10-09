import Foundation

/// A points boost to create. May optionally target a specific user via `userId` or filter by user attributes via `userAttributes`. These two fields are mutually exclusive.
public struct CreatePointsBoostRequestItem: Codable, Hashable, Sendable {
    /// The ID of the user to create a boost for. Mutually exclusive with `userAttributes` — providing `userAttributes` when `userId` is set will result in an error. Omit for a global boost.
    public let userId: String?
    /// The name of the boost.
    public let name: String
    /// The start date of the boost (YYYY-MM-DD).
    public let start: String
    /// The end date of the boost (YYYY-MM-DD). If null, the boost has no end date.
    public let end: String?
    /// The points multiplier. Must be greater than 0, not equal to 1, and less than 100.
    public let multiplier: Double
    /// How to round the boosted points. Defaults to 'down'.
    public let rounding: CreatePointsBoostRequestItemRounding?
    /// User attribute filters for the boost. Cannot be provided when `userId` is set.
    public let userAttributes: [CreatePointsBoostRequestItemUserAttributesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        userId: String? = nil,
        name: String,
        start: String,
        end: String? = nil,
        multiplier: Double,
        rounding: CreatePointsBoostRequestItemRounding? = nil,
        userAttributes: [CreatePointsBoostRequestItemUserAttributesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.userId = userId
        self.name = name
        self.start = start
        self.end = end
        self.multiplier = multiplier
        self.rounding = rounding
        self.userAttributes = userAttributes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
        self.name = try container.decode(String.self, forKey: .name)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decodeIfPresent(String.self, forKey: .end)
        self.multiplier = try container.decode(Double.self, forKey: .multiplier)
        self.rounding = try container.decodeIfPresent(CreatePointsBoostRequestItemRounding.self, forKey: .rounding)
        self.userAttributes = try container.decodeIfPresent([CreatePointsBoostRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.start, forKey: .start)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encode(self.multiplier, forKey: .multiplier)
        try container.encodeIfPresent(self.rounding, forKey: .rounding)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case userId
        case name
        case start
        case end
        case multiplier
        case rounding
        case userAttributes
    }
}