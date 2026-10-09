import Foundation

public struct PatchPointsTriggersRequestItem: Codable, Hashable, Sendable {
    /// The UUID of the trigger to update.
    public let id: String
    /// Updated trigger type. Can only be changed when the trigger is inactive. Required fields for the new type must be provided.
    public let type: PatchPointsTriggersRequestItemType?
    /// Updated points value.
    public let points: Int?
    /// Updated status.
    public let status: PatchPointsTriggersRequestItemStatus?
    /// Updated user attribute filters. Set to null to clear.
    public let userAttributes: [PatchPointsTriggersRequestItemUserAttributesItem]?
    /// Updated metric ID. Only permitted for metric triggers.
    public let metricId: String?
    /// Updated metric threshold. Only permitted for metric triggers.
    public let metricThreshold: Int?
    /// Updated event attribute filters. Only permitted for metric triggers. Set to null to clear.
    public let eventAttributes: [PatchPointsTriggersRequestItemEventAttributesItem]?
    /// Updated achievement ID. Only permitted for achievement triggers.
    public let achievementId: String?
    /// Updated streak length. Only permitted for streak triggers.
    public let streakLength: Int?
    /// Updated time unit. Only permitted for time triggers.
    public let timeUnit: PatchPointsTriggersRequestItemTimeUnit?
    /// Updated time interval. Only permitted for time triggers.
    public let timeInterval: Int?
    /// Updated block-if-out-of-points setting.
    public let blockIfOutOfPoints: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        type: PatchPointsTriggersRequestItemType? = nil,
        points: Int? = nil,
        status: PatchPointsTriggersRequestItemStatus? = nil,
        userAttributes: [PatchPointsTriggersRequestItemUserAttributesItem]? = nil,
        metricId: String? = nil,
        metricThreshold: Int? = nil,
        eventAttributes: [PatchPointsTriggersRequestItemEventAttributesItem]? = nil,
        achievementId: String? = nil,
        streakLength: Int? = nil,
        timeUnit: PatchPointsTriggersRequestItemTimeUnit? = nil,
        timeInterval: Int? = nil,
        blockIfOutOfPoints: Bool? = nil,
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
        self.type = try container.decodeIfPresent(PatchPointsTriggersRequestItemType.self, forKey: .type)
        self.points = try container.decodeIfPresent(Int.self, forKey: .points)
        self.status = try container.decodeIfPresent(PatchPointsTriggersRequestItemStatus.self, forKey: .status)
        self.userAttributes = try container.decodeIfPresent([PatchPointsTriggersRequestItemUserAttributesItem].self, forKey: .userAttributes)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.metricThreshold = try container.decodeIfPresent(Int.self, forKey: .metricThreshold)
        self.eventAttributes = try container.decodeIfPresent([PatchPointsTriggersRequestItemEventAttributesItem].self, forKey: .eventAttributes)
        self.achievementId = try container.decodeIfPresent(String.self, forKey: .achievementId)
        self.streakLength = try container.decodeIfPresent(Int.self, forKey: .streakLength)
        self.timeUnit = try container.decodeIfPresent(PatchPointsTriggersRequestItemTimeUnit.self, forKey: .timeUnit)
        self.timeInterval = try container.decodeIfPresent(Int.self, forKey: .timeInterval)
        self.blockIfOutOfPoints = try container.decodeIfPresent(Bool.self, forKey: .blockIfOutOfPoints)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.points, forKey: .points)
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