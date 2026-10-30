import Foundation

public struct UpdateRewardTriggersRequestItem: Codable, Hashable, Sendable {
    /// The UUID of the trigger to update.
    public let id: String
    /// Updated trigger type. Can only be changed when the trigger is inactive. Required fields for the new type must be provided.
    public let type: UpdateRewardTriggersRequestItemType?
    /// Updated status.
    public let status: UpdateRewardTriggersRequestItemStatus?
    /// Updated user attribute filters. Set to null to clear.
    public let userAttributes: [UpdateRewardTriggersRequestItemUserAttributesItem]?
    /// Updated metric ID. Only permitted for metric triggers.
    public let metricId: String?
    /// Updated metric threshold. Only permitted for metric triggers.
    public let metricThreshold: Int?
    /// Updated event attribute filters. Only permitted for metric triggers. Set to null to clear.
    public let eventAttributes: [UpdateRewardTriggersRequestItemEventAttributesItem]?
    /// Updated achievement ID. Only permitted for achievement triggers.
    public let achievementId: String?
    /// Updated streak length. Only permitted for streak triggers.
    public let streakLength: Int?
    /// Updated leaderboard ID. Only permitted for leaderboard triggers.
    public let leaderboardId: String?
    /// Updated rank. Only permitted for leaderboard triggers.
    public let rank: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        type: UpdateRewardTriggersRequestItemType? = nil,
        status: UpdateRewardTriggersRequestItemStatus? = nil,
        userAttributes: [UpdateRewardTriggersRequestItemUserAttributesItem]? = nil,
        metricId: String? = nil,
        metricThreshold: Int? = nil,
        eventAttributes: [UpdateRewardTriggersRequestItemEventAttributesItem]? = nil,
        achievementId: String? = nil,
        streakLength: Int? = nil,
        leaderboardId: String? = nil,
        rank: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.type = type
        self.status = status
        self.userAttributes = userAttributes
        self.metricId = metricId
        self.metricThreshold = metricThreshold
        self.eventAttributes = eventAttributes
        self.achievementId = achievementId
        self.streakLength = streakLength
        self.leaderboardId = leaderboardId
        self.rank = rank
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decodeIfPresent(UpdateRewardTriggersRequestItemType.self, forKey: .type)
        self.status = try container.decodeIfPresent(UpdateRewardTriggersRequestItemStatus.self, forKey: .status)
        self.userAttributes = try container.decodeIfPresent([UpdateRewardTriggersRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricThreshold = try container.decodeIfPresent(Int.self, forKey: .metricThreshold)
        self.eventAttributes = try container.decodeIfPresent([UpdateRewardTriggersRequestItemEventAttributesItem].self, forKey: .eventAttributes)
        self.achievementId = try container.decodeIfPresent(String.self, forKey: .achievementId)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.leaderboardId = try container.decodeIfPresent(String.self, forKey: .leaderboardId)
        self.rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.metricThreshold, forKey: .metricThreshold)
        try container.encodeIfPresent(self.eventAttributes, forKey: .eventAttributes)
        try container.encodeIfPresent(self.achievementId, forKey: .achievementId)
        try container.encodeIfPresent(self.streakLength, forKey: .streakLength)
        try container.encodeIfPresent(self.leaderboardId, forKey: .leaderboardId)
        try container.encodeIfPresent(self.rank, forKey: .rank)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case type
        case status
        case userAttributes
        case metricId
        case metricThreshold
        case eventAttributes
        case achievementId
        case streakLength
        case leaderboardId
        case rank
    }
}