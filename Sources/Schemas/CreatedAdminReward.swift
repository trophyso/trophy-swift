import Foundation

/// A reward returned from the creation endpoint. Extends AdminReward with the triggers created alongside it, present when triggers were included in the creation request.
public struct CreatedAdminReward: Codable, Hashable, Sendable {
    /// The UUID of the reward.
    public let id: String
    /// The reward name.
    public let name: String
    /// The reward key.
    public let key: String
    /// The reward description.
    public let description: String?
    /// The reward status.
    public let status: AdminRewardStatus
    /// The type of reward.
    public let type: AdminRewardType
    /// The UUID of the points system. Only present for points rewards.
    public let pointsSystemId: String?
    /// The number of points granted. Only present for points rewards.
    public let points: Int?
    /// The maximum number of times a user can be awarded the reward. Null means unlimited.
    public let maxRedemptions: Int?
    /// User attribute filters applied to the reward.
    public let userAttributes: [AdminRewardUserAttributesItem]
    /// Triggers created alongside the reward. Present when triggers were provided in the request.
    public let triggers: [AdminRewardTrigger]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        key: String,
        description: String? = nil,
        status: AdminRewardStatus,
        type: AdminRewardType,
        pointsSystemId: String? = nil,
        points: Int? = nil,
        maxRedemptions: Int? = nil,
        userAttributes: [AdminRewardUserAttributesItem],
        triggers: [AdminRewardTrigger]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
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
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.status = try container.decode(AdminRewardStatus.self, forKey: .status)
        self.type = try container.decode(AdminRewardType.self, forKey: .type)
        self.pointsSystemId = try container.decodeIfPresent(String.self, forKey: .pointsSystemId)
        self.points = try container.decodeIfPresent(Int.self, forKey: .points)
        self.maxRedemptions = try container.decodeIfPresent(Int.self, forKey: .maxRedemptions)
        self.userAttributes = try container.decode([AdminRewardUserAttributesItem].self, forKey: .userAttributes)
        self.triggers = try container.decodeIfPresent([AdminRewardTrigger].self, forKey: .triggers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.pointsSystemId, forKey: .pointsSystemId)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.maxRedemptions, forKey: .maxRedemptions)
        try container.encode(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.triggers, forKey: .triggers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
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