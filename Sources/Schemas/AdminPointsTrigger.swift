import Foundation

/// A points trigger as returned from admin endpoints.
public struct AdminPointsTrigger: Codable, Hashable, Sendable {
    /// The UUID of the trigger.
    public let id: String
    /// The type of trigger.
    public let type: AdminPointsTriggerType
    /// The number of points awarded or deducted when the trigger fires.
    public let points: Int
    /// The status of the trigger.
    public let status: AdminPointsTriggerStatus
    /// User attribute filters applied to the trigger.
    public let userAttributes: [AdminPointsTriggerUserAttributesItem]
    /// The UUID of the metric. Only present for metric triggers.
    public let metricId: String?
    /// The metric threshold. Only present for metric triggers.
    public let metricThreshold: Int?
    /// Event attribute filters applied to the trigger. Only present for metric triggers.
    public let eventAttributes: [AdminPointsTriggerEventAttributesItem]?
    /// The UUID of the achievement. Only present for achievement triggers.
    public let achievementId: String?
    /// The streak length. Only present for streak triggers.
    public let streakLength: Int?
    /// The time unit. Only present for time triggers.
    public let timeUnit: AdminPointsTriggerTimeUnit?
    /// The time interval. Only present for time triggers.
    public let timeInterval: Int?
    /// Whether metric events that would reduce the user's points below zero are blocked.
    public let blockIfOutOfPoints: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        type: AdminPointsTriggerType,
        points: Int,
        status: AdminPointsTriggerStatus,
        userAttributes: [AdminPointsTriggerUserAttributesItem],
        metricId: String? = nil,
        metricThreshold: Int? = nil,
        eventAttributes: [AdminPointsTriggerEventAttributesItem]? = nil,
        achievementId: String? = nil,
        streakLength: Int? = nil,
        timeUnit: AdminPointsTriggerTimeUnit? = nil,
        timeInterval: Int? = nil,
        blockIfOutOfPoints: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
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
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(AdminPointsTriggerType.self, forKey: .type)
        self.points = try container.decode(Int.self, forKey: .points)
        self.status = try container.decode(AdminPointsTriggerStatus.self, forKey: .status)
        self.userAttributes = try container.decode([AdminPointsTriggerUserAttributesItem].self, forKey: .userAttributes)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricThreshold = try container.decodeIfPresent(Int.self, forKey: .metricThreshold)
        self.eventAttributes = try container.decodeIfPresent([AdminPointsTriggerEventAttributesItem].self, forKey: .eventAttributes)
        self.achievementId = try container.decodeIfPresent(String.self, forKey: .achievementId)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.timeUnit = try container.decodeIfPresent(AdminPointsTriggerTimeUnit.self, forKey: .timeUnit)
        self.timeInterval = try container.decodeIfPresent(Int.self, forKey: .timeInterval)
        self.blockIfOutOfPoints = try container.decode(Bool.self, forKey: .blockIfOutOfPoints)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.points, forKey: .points)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.userAttributes, forKey: .userAttributes)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.metricThreshold, forKey: .metricThreshold)
        try container.encodeIfPresent(self.eventAttributes, forKey: .eventAttributes)
        try container.encodeIfPresent(self.achievementId, forKey: .achievementId)
        try container.encodeIfPresent(self.streakLength, forKey: .streakLength)
        try container.encodeIfPresent(self.timeUnit, forKey: .timeUnit)
        try container.encodeIfPresent(self.timeInterval, forKey: .timeInterval)
        try container.encode(self.blockIfOutOfPoints, forKey: .blockIfOutOfPoints)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
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