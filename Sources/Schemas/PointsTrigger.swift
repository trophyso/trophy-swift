import Foundation

public struct PointsTrigger: Codable, Hashable, Sendable {
    /// The ID of the trigger
    public let id: String
    /// The type of trigger
    public let type: PointsTriggerType
    /// The points awarded by this trigger.
    public let points: Int
    /// The status of the trigger.
    public let status: PointsTriggerStatus
    /// The unique ID of the achievement associated with this trigger, if the trigger is an achievement.
    public let achievementId: String?
    /// The unique ID of the metric associated with this trigger, if the trigger is a metric.
    public let metricId: String?
    /// If the trigger has type 'metric', the name of the metric
    public let metricName: String?
    /// If the trigger has type 'metric', the threshold of the metric that triggers the points
    public let metricThreshold: Int?
    /// If the trigger has type 'streak', the threshold of the streak that triggers the points
    public let streakLengthThreshold: Int?
    /// If the trigger has type 'achievement', the name of the achievement
    public let achievementName: String?
    /// If the trigger has type 'time', the unit of time after which to award points
    public let timeUnit: PointsTriggerTimeUnit?
    /// If the trigger has type 'time', the numer of units of timeUnit after which to award points
    public let timeInterval: Int?
    /// User attribute filters that must be met for this trigger to award points. Empty when the trigger has no user attribute filters configured.
    public let userAttributes: [PointsTriggerUserAttributesItem]
    /// Deprecated. Event attribute filter that must be met for this trigger to award points. Only present if the trigger has an event filter configured.
    public let eventAttribute: PointsTriggerEventAttribute?
    /// If the trigger has type 'metric', the event attributes that must match for the trigger to award points. Empty when the trigger is metric-based and has no event attribute filters. Omitted for non-metric triggers.
    public let eventAttributes: [PointsTriggerEventAttributesItem]?
    /// The date and time the trigger was created, in ISO 8601 format.
    public let created: Date
    /// The date and time the trigger was last updated, in ISO 8601 format.
    public let updated: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        type: PointsTriggerType,
        points: Int,
        status: PointsTriggerStatus,
        achievementId: String? = nil,
        metricId: String? = nil,
        metricName: String? = nil,
        metricThreshold: Int? = nil,
        streakLengthThreshold: Int? = nil,
        achievementName: String? = nil,
        timeUnit: PointsTriggerTimeUnit? = nil,
        timeInterval: Int? = nil,
        userAttributes: [PointsTriggerUserAttributesItem],
        eventAttribute: PointsTriggerEventAttribute? = nil,
        eventAttributes: [PointsTriggerEventAttributesItem]? = nil,
        created: Date,
        updated: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.type = type
        self.points = points
        self.status = status
        self.achievementId = achievementId
        self.metricId = metricId
        self.metricName = metricName
        self.metricThreshold = metricThreshold
        self.streakLengthThreshold = streakLengthThreshold
        self.achievementName = achievementName
        self.timeUnit = timeUnit
        self.timeInterval = timeInterval
        self.userAttributes = userAttributes
        self.eventAttribute = eventAttribute
        self.eventAttributes = eventAttributes
        self.created = created
        self.updated = updated
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(PointsTriggerType.self, forKey: .type)
        self.points = try container.decode(Int.self, forKey: .points)
        self.status = try container.decode(PointsTriggerStatus.self, forKey: .status)
        self.achievementId = try container.decodeIfPresent(String.self, forKey: .achievementId)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricName = try container.decodeIfPresent(String.self, forKey: .metricName)
        self.metricThreshold = try container.decodeIfPresent(Int.self, forKey: .metricThreshold)
        self.streakLengthThreshold = try container.decodeIfPresent(Int.self, forKey: .streakLengthThreshold)
        self.achievementName = try container.decodeIfPresent(String.self, forKey: .achievementName)
        self.timeUnit = try container.decodeIfPresent(PointsTriggerTimeUnit.self, forKey: .timeUnit)
        self.timeInterval = try container.decodeIfPresent(Int.self, forKey: .timeInterval)
        self.userAttributes = try container.decode([PointsTriggerUserAttributesItem].self, forKey: .userAttributes)
        self.eventAttribute = try container.decodeIfPresent(PointsTriggerEventAttribute.self, forKey: .eventAttribute)
        self.eventAttributes = try container.decodeIfPresent([PointsTriggerEventAttributesItem].self, forKey: .eventAttributes)
        self.created = try container.decode(Date.self, forKey: .created)
        self.updated = try container.decode(Date.self, forKey: .updated)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.points, forKey: .points)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.achievementId, forKey: .achievementId)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.metricName, forKey: .metricName)
        try container.encodeIfPresent(self.metricThreshold, forKey: .metricThreshold)
        try container.encodeIfPresent(self.streakLengthThreshold, forKey: .streakLengthThreshold)
        try container.encodeIfPresent(self.achievementName, forKey: .achievementName)
        try container.encodeIfPresent(self.timeUnit, forKey: .timeUnit)
        try container.encodeIfPresent(self.timeInterval, forKey: .timeInterval)
        try container.encode(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.eventAttribute, forKey: .eventAttribute)
        try container.encodeIfPresent(self.eventAttributes, forKey: .eventAttributes)
        try container.encode(self.created, forKey: .created)
        try container.encode(self.updated, forKey: .updated)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case type
        case points
        case status
        case achievementId
        case metricId
        case metricName
        case metricThreshold
        case streakLengthThreshold
        case achievementName
        case timeUnit
        case timeInterval
        case userAttributes
        case eventAttribute
        case eventAttributes
        case created
        case updated
    }
}