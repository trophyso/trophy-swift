import Foundation

/// An achievement update object. `id` is required; all other fields are optional. Omitted fields are preserved. Send `null` for `description`, `badge`, or `userAttributes` to clear them.
public struct UpdateAchievementRequestItem: Codable, Hashable, Sendable {
    /// The UUID of the achievement to update.
    public let id: String
    /// The updated achievement name.
    public let name: String?
    /// The updated trigger type. Changing trigger requires the new trigger's mandatory fields.
    public let trigger: UpdateAchievementRequestItemTrigger?
    /// The updated description. Send `null` to clear.
    public let description: String?
    /// The updated status.
    public let status: UpdateAchievementRequestItemStatus?
    /// The updated badge, or `null` to clear it.
    public let badge: UpdateAchievementRequestItemBadge?
    /// Updated user attribute filters. Send `null` to clear. Each `attributeId` must be an active user attribute.
    public let userAttributes: [UpdateAchievementRequestItemUserAttributesItem]?
    /// Updated key. Only permitted for API achievements.
    public let key: String?
    /// Updated metric ID. Only permitted for metric achievements.
    public let metricId: String?
    /// Updated metric threshold. Only permitted for metric achievements.
    public let metricValue: Double?
    /// Updated event attribute filters. Only permitted for metric achievements. Send `null` to clear. Each `attributeId` must be an active event attribute.
    public let eventAttributes: [UpdateAchievementRequestItemEventAttributesItem]?
    /// Updated streak length. Only permitted for streak achievements.
    public let streakLength: Int?
    /// Updated anniversary years. Only permitted for anniversary achievements.
    public let anniversaryYears: Int?
    /// Updated prerequisite achievement UUIDs. Only permitted for achievement achievements.
    public let achievementIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String? = nil,
        trigger: UpdateAchievementRequestItemTrigger? = nil,
        description: String? = nil,
        status: UpdateAchievementRequestItemStatus? = nil,
        badge: UpdateAchievementRequestItemBadge? = nil,
        userAttributes: [UpdateAchievementRequestItemUserAttributesItem]? = nil,
        key: String? = nil,
        metricId: String? = nil,
        metricValue: Double? = nil,
        eventAttributes: [UpdateAchievementRequestItemEventAttributesItem]? = nil,
        streakLength: Int? = nil,
        anniversaryYears: Int? = nil,
        achievementIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.trigger = trigger
        self.description = description
        self.status = status
        self.badge = badge
        self.userAttributes = userAttributes
        self.key = key
        self.metricId = metricId
        self.metricValue = metricValue
        self.eventAttributes = eventAttributes
        self.streakLength = streakLength
        self.anniversaryYears = anniversaryYears
        self.achievementIds = achievementIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.trigger = try container.decodeIfPresent(UpdateAchievementRequestItemTrigger.self, forKey: .trigger)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.status = try container.decodeIfPresent(UpdateAchievementRequestItemStatus.self, forKey: .status)
        self.badge = try container.decodeIfPresent(UpdateAchievementRequestItemBadge.self, forKey: .badge)
        self.userAttributes = try container.decodeIfPresent([UpdateAchievementRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricValue = try container.decodeIfPresent(Double.self, forKey: .metricValue)
        self.eventAttributes = try container.decodeIfPresent([UpdateAchievementRequestItemEventAttributesItem].self, forKey: .eventAttributes)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.anniversaryYears = try container.decodeIfPresent(Int.self, forKey: .anniversaryYears)
        self.achievementIds = try container.decodeIfPresent([String].self, forKey: .achievementIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.trigger, forKey: .trigger)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.badge, forKey: .badge)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.metricValue, forKey: .metricValue)
        try container.encodeIfPresent(self.eventAttributes, forKey: .eventAttributes)
        try container.encodeIfPresent(self.streakLength, forKey: .streakLength)
        try container.encodeIfPresent(self.anniversaryYears, forKey: .anniversaryYears)
        try container.encodeIfPresent(self.achievementIds, forKey: .achievementIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case trigger
        case description
        case status
        case badge
        case userAttributes
        case key
        case metricId
        case metricValue
        case eventAttributes
        case streakLength
        case anniversaryYears
        case achievementIds
    }
}