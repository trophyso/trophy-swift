import Foundation

/// Points boost payload sent in points.boost_started and points.boost_finished webhook events.
public struct PointsBoostWebhookPayload: Codable, Hashable, Sendable {
    /// The ID of the points boost.
    public let id: String
    /// The name of the points boost.
    public let name: String
    /// The status of the points boost.
    public let status: PointsBoostWebhookPayloadStatus
    /// The user ID the boost is scoped to, or null for global boosts.
    public let userId: String?
    /// The ID of the points system this boost applies to.
    public let pointsSystemId: String
    /// The key of the points system this boost applies to.
    public let pointsSystemKey: String
    /// The name of the points system this boost applies to.
    public let pointsSystemName: String
    /// The start date of the points boost (YYYY-MM-DD).
    public let start: String
    /// The end date of the points boost (YYYY-MM-DD), or null if open-ended.
    public let end: String?
    /// The multiplier applied to points during the boost.
    public let multiplier: Double
    /// The rounding method applied to boosted points.
    public let rounding: PointsBoostWebhookPayloadRounding
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        status: PointsBoostWebhookPayloadStatus,
        userId: String? = nil,
        pointsSystemId: String,
        pointsSystemKey: String,
        pointsSystemName: String,
        start: String,
        end: String? = nil,
        multiplier: Double,
        rounding: PointsBoostWebhookPayloadRounding,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.userId = userId
        self.pointsSystemId = pointsSystemId
        self.pointsSystemKey = pointsSystemKey
        self.pointsSystemName = pointsSystemName
        self.start = start
        self.end = end
        self.multiplier = multiplier
        self.rounding = rounding
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(PointsBoostWebhookPayloadStatus.self, forKey: .status)
        self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
        self.pointsSystemId = try container.decode(String.self, forKey: .pointsSystemId)
        self.pointsSystemKey = try container.decode(String.self, forKey: .pointsSystemKey)
        self.pointsSystemName = try container.decode(String.self, forKey: .pointsSystemName)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decodeIfPresent(String.self, forKey: .end)
        self.multiplier = try container.decode(Double.self, forKey: .multiplier)
        self.rounding = try container.decode(PointsBoostWebhookPayloadRounding.self, forKey: .rounding)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encode(self.pointsSystemId, forKey: .pointsSystemId)
        try container.encode(self.pointsSystemKey, forKey: .pointsSystemKey)
        try container.encode(self.pointsSystemName, forKey: .pointsSystemName)
        try container.encode(self.start, forKey: .start)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encode(self.multiplier, forKey: .multiplier)
        try container.encode(self.rounding, forKey: .rounding)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case status
        case userId
        case pointsSystemId
        case pointsSystemKey
        case pointsSystemName
        case start
        case end
        case multiplier
        case rounding
    }
}