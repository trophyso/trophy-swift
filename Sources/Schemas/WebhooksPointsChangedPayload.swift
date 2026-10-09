import Foundation

public struct WebhooksPointsChangedPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: PointsChanged
    /// The user whose points increased or decreased.
    public let user: User
    /// The user's points after the event (includes added amount for this event).
    public let points: MetricEventPointsResponse
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: PointsChanged,
        user: User,
        points: MetricEventPointsResponse,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.user = user
        self.points = points
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(PointsChanged.self, forKey: .type)
        self.user = try container.decode(User.self, forKey: .user)
        self.points = try container.decode(MetricEventPointsResponse.self, forKey: .points)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.points, forKey: .points)
    }

    public enum PointsChanged: String, Codable, Hashable, CaseIterable, Sendable {
        case pointsChanged = "points.changed"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case user
        case points
    }
}