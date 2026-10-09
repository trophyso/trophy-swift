import Foundation

/// A points trigger to create.
public struct CreatePointsTriggerRequestItem: Codable, Hashable, Sendable {
    /// The type of trigger.
    public let type: CreatePointsTriggerRequestItemType
    /// The number of points to award or deduct when the trigger fires. Cannot be zero.
    public let points: Int
    /// The status of the trigger. Defaults to 'inactive'.
    public let status: CreatePointsTriggerRequestItemStatus?
    /// Optional user attribute filters for the trigger.
    public let userAttributes: [CreatePointsTriggerRequestItemUserAttributesItem]?
    /// Required if type is `metric`. The UUID of the metric.
    public let metricId: String?
    /// Required if type is `metric`. The metric increment that triggers the points.
    public let metricThreshold: Int?
    /// Optional event attribute filters. Only permitted if type is `metric`.
    public let eventAttributes: [CreatePointsTriggerRequestItemEventAttributesItem]?
    /// Required if type is `achievement`. The UUID of the achievement.
    public let achievementId: String?
    /// Required if type is `streak`. The number of streak periods that triggers the points.
    public let streakLength: Int?
    /// Required if type is `time`. The unit for the time interval.
    public let timeUnit: CreatePointsTriggerRequestItemTimeUnit?
    /// Required if type is `time`. The number of time units between recurring awards.
    public let timeInterval: Int?
    /// Whether to block metric events that would reduce the user's points below zero. Defaults to false.
    public let blockIfOutOfPoints: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: CreatePointsTriggerRequestItemType,
        points: Int,
        status: CreatePointsTriggerRequestItemStatus? = nil,
        userAttributes: [CreatePointsTriggerRequestItemUserAttributesItem]? = nil,
        metricId: String? = nil,
        metricThreshold: Int? = nil,
        eventAttributes: [CreatePointsTriggerRequestItemEventAttributesItem]? = nil,
        achievementId: String? = nil,
        streakLength: Int? = nil,
        timeUnit: CreatePointsTriggerRequestItemTimeUnit? = nil,
        timeInterval: Int? = nil,
        blockIfOutOfPoints: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.points = points
        self.status = status
        self.userAttributes = userAttributes
        self.metricId = metricId
        self.metricThreshold = metricThreshold
        self.eventAttributes = eventAttributes
        self.achievementId = achievementId
        self.streakLength = streakLength
        self.timeUnit = timeUnit
        self.timeInterval = timeInterval
        self.blockIfOutOfPoints = blockIfOutOfPoints
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(CreatePointsTriggerRequestItemType.self, forKey: .type)
        self.points = try container.decode(Int.self, forKey: .points)
        self.status = try container.decodeIfPresent(CreatePointsTriggerRequestItemStatus.self, forKey: .status)
        self.userAttributes = try container.decodeIfPresent([CreatePointsTriggerRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricThreshold = try container.decodeIfPresent(Int.self, forKey: .metricThreshold)
        self.eventAttributes = try container.decodeIfPresent([CreatePointsTriggerRequestItemEventAttributesItem].self, forKey: .eventAttributes)
        self.achievementId = try container.decodeIfPresent(String.self, forKey: .achievementId)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.timeUnit = try container.decodeIfPresent(CreatePointsTriggerRequestItemTimeUnit.self, forKey: .timeUnit)
        self.timeInterval = try container.decodeIfPresent(Int.self, forKey: .timeInterval)
        self.blockIfOutOfPoints = try container.decodeIfPresent(Bool.self, forKey: .blockIfOutOfPoints)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.points, forKey: .points)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.metricThreshold, forKey: .metricThreshold)
        try container.encodeIfPresent(self.eventAttributes, forKey: .eventAttributes)
        try container.encodeIfPresent(self.achievementId, forKey: .achievementId)
        try container.encodeIfPresent(self.streakLength, forKey: .streakLength)
        try container.encodeIfPresent(self.timeUnit, forKey: .timeUnit)
        try container.encodeIfPresent(self.timeInterval, forKey: .timeInterval)
        try container.encodeIfPresent(self.blockIfOutOfPoints, forKey: .blockIfOutOfPoints)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case points
        case status
        case userAttributes
        case metricId
        case metricThreshold
        case eventAttributes
        case achievementId
        case streakLength
        case timeUnit
        case timeInterval
        case blockIfOutOfPoints
    }
}