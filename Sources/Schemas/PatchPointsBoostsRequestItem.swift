import Foundation

public struct PatchPointsBoostsRequestItem: Codable, Hashable, Sendable {
    /// The UUID of the boost to update.
    public let id: String
    /// Updated name for the boost.
    public let name: String?
    /// Updated start date (YYYY-MM-DD).
    public let start: String?
    /// Updated end date (YYYY-MM-DD) or null to remove end date.
    public let end: String?
    /// Updated points multiplier.
    public let multiplier: Double?
    /// Updated rounding strategy.
    public let rounding: PatchPointsBoostsRequestItemRounding?
    /// Updated user attribute filters. Cannot be set on user-specific boosts. Set to null to clear.
    public let userAttributes: [PatchPointsBoostsRequestItemUserAttributesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String? = nil,
        start: String? = nil,
        end: String? = nil,
        multiplier: Double? = nil,
        rounding: PatchPointsBoostsRequestItemRounding? = nil,
        userAttributes: [PatchPointsBoostsRequestItemUserAttributesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
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
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.start = try container.decodeIfPresent(String.self, forKey: .start)
        self.end = try container.decodeIfPresent(String.self, forKey: .end)
        self.multiplier = try container.decodeIfPresent(Double.self, forKey: .multiplier)
        self.rounding = try container.decodeIfPresent(PatchPointsBoostsRequestItemRounding.self, forKey: .rounding)
        self.userAttributes = try container.decodeIfPresent([PatchPointsBoostsRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.start, forKey: .start)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.multiplier, forKey: .multiplier)
        try container.encodeIfPresent(self.rounding, forKey: .rounding)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case start
        case end
        case multiplier
        case rounding
        case userAttributes
    }
}