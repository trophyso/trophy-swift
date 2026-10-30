import Foundation

/// A reward to create. Optionally include triggers.
public struct CreateRewardRequestItem: Codable, Hashable, Sendable {
    /// The reward name.
    public let name: String
    /// The reward key. Only alphanumeric characters, hyphens, and underscores are permitted.
    public let key: String
    /// A short description of the reward.
    public let description: String?
    /// The status of the reward. Defaults to 'inactive'.
    public let status: CreateRewardRequestItemStatus?
    /// The type of reward. `points` rewards grant points when redeemed. `custom` rewards are fulfilled by your own system.
    public let type: CreateRewardRequestItemType
    /// Required if type is `points`. The UUID of the points system to grant points in.
    public let pointsSystemId: String?
    /// Required if type is `points`. The number of points to grant.
    public let points: Int?
    /// The maximum number of times a user can be awarded the reward. Null means unlimited.
    public let maxRedemptions: Int?
    /// Optional user attribute filters. Only users who match are awarded the reward.
    public let userAttributes: [CreateRewardRequestItemUserAttributesItem]?
    /// Optional array of triggers to create alongside the reward.
    public let triggers: [CreateRewardTriggerRequestItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        key: String,
        description: String? = nil,
        status: CreateRewardRequestItemStatus? = nil,
        type: CreateRewardRequestItemType,
        pointsSystemId: String? = nil,
        points: Int? = nil,
        maxRedemptions: Int? = nil,
        userAttributes: [CreateRewardRequestItemUserAttributesItem]? = nil,
        triggers: [CreateRewardTriggerRequestItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.key = key
        self.description = description
        self.status = status
        self.type = type
        self.pointsSystemId = pointsSystemId
        self.points = points
        self.maxRedemptions = maxRedemptions
        self.userAttributes = userAttributes
        self.triggers = triggers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.status = try container.decodeIfPresent(CreateRewardRequestItemStatus.self, forKey: .status)
        self.type = try container.decode(CreateRewardRequestItemType.self, forKey: .type)
        self.pointsSystemId = try container.decodeIfPresent(String.self, forKey: .pointsSystemId)
        self.points = try container.decodeIfPresent(Int.self, forKey: .points)
        self.maxRedemptions = try container.decodeIfPresent(Int.self, forKey: .maxRedemptions)
        self.userAttributes = try container.decodeIfPresent([CreateRewardRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.triggers = try container.decodeIfPresent([CreateRewardTriggerRequestItem].self, forKey: .triggers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.pointsSystemId, forKey: .pointsSystemId)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.maxRedemptions, forKey: .maxRedemptions)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.triggers, forKey: .triggers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case key
        case description
        case status
        case type
        case pointsSystemId
        case points
        case maxRedemptions
        case userAttributes
        case triggers
    }
}