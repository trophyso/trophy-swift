import Foundation

/// A reward update object. Only id is required; all other fields are optional. Triggers are updated through the reward triggers endpoints.
public struct UpdateRewardRequestItem: Codable, Hashable, Sendable {
    /// The UUID of the reward to update.
    public let id: String
    /// Updated name.
    public let name: String?
    /// Updated description. Set to null to clear.
    public let description: String?
    /// Updated status.
    public let status: UpdateRewardRequestItemStatus?
    /// Updated type. Changing to `points` requires pointsSystemId and points if the reward has none.
    public let type: UpdateRewardRequestItemType?
    /// Updated points system ID. Only permitted for points rewards.
    public let pointsSystemId: String?
    /// Updated number of points. Only permitted for points rewards.
    public let points: Int?
    /// Updated maximum awards per user. Set to null for unlimited.
    public let maxRedemptions: Int?
    /// Updated user attribute filters. Set to null to clear.
    public let userAttributes: [UpdateRewardRequestItemUserAttributesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String? = nil,
        description: String? = nil,
        status: UpdateRewardRequestItemStatus? = nil,
        type: UpdateRewardRequestItemType? = nil,
        pointsSystemId: String? = nil,
        points: Int? = nil,
        maxRedemptions: Int? = nil,
        userAttributes: [UpdateRewardRequestItemUserAttributesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.status = status
        self.type = type
        self.pointsSystemId = pointsSystemId
        self.points = points
        self.maxRedemptions = maxRedemptions
        self.userAttributes = userAttributes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.status = try container.decodeIfPresent(UpdateRewardRequestItemStatus.self, forKey: .status)
        self.type = try container.decodeIfPresent(UpdateRewardRequestItemType.self, forKey: .type)
        self.pointsSystemId = try container.decodeIfPresent(String.self, forKey: .pointsSystemId)
        self.points = try container.decodeIfPresent(Int.self, forKey: .points)
        self.maxRedemptions = try container.decodeIfPresent(Int.self, forKey: .maxRedemptions)
        self.userAttributes = try container.decodeIfPresent([UpdateRewardRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.pointsSystemId, forKey: .pointsSystemId)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.maxRedemptions, forKey: .maxRedemptions)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case description
        case status
        case type
        case pointsSystemId
        case points
        case maxRedemptions
        case userAttributes
    }
}