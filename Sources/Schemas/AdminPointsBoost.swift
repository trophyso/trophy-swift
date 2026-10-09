import Foundation

/// A points boost as returned from admin endpoints.
public struct AdminPointsBoost: Codable, Hashable, Sendable {
    /// The UUID of the boost.
    public let id: String
    /// The name of the boost.
    public let name: String
    /// The status of the boost.
    public let status: AdminPointsBoostStatus
    /// The start date (YYYY-MM-DD).
    public let start: String
    /// The end date (YYYY-MM-DD) or null if no end date.
    public let end: String?
    /// The points multiplier.
    public let multiplier: Double
    /// How boosted points are rounded.
    public let rounding: AdminPointsBoostRounding
    /// The ID of the user the boost was created for, or null for global/attribute-filtered boosts.
    public let userId: String?
    /// User attribute filters applied to the boost. Only present for non-user-specific boosts (i.e. when `userId` is null). Empty array if no filters are set.
    public let userAttributes: [AdminPointsBoostUserAttributesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        status: AdminPointsBoostStatus,
        start: String,
        end: String? = nil,
        multiplier: Double,
        rounding: AdminPointsBoostRounding,
        userId: String? = nil,
        userAttributes: [AdminPointsBoostUserAttributesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.start = start
        self.end = end
        self.multiplier = multiplier
        self.rounding = rounding
        self.userId = userId
        self.userAttributes = userAttributes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(AdminPointsBoostStatus.self, forKey: .status)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decodeIfPresent(String.self, forKey: .end)
        self.multiplier = try container.decode(Double.self, forKey: .multiplier)
        self.rounding = try container.decode(AdminPointsBoostRounding.self, forKey: .rounding)
        self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
        self.userAttributes = try container.decodeIfPresent([AdminPointsBoostUserAttributesItem].self, forKey: .userAttributes)
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
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
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
        case userId
        case userAttributes
    }
}