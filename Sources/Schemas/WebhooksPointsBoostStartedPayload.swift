import Foundation

public struct WebhooksPointsBoostStartedPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: PointsBoostStarted
    /// When the event occurred (ISO 8601).
    public let timestamp: Date
    /// The points boost that started.
    public let boost: PointsBoostWebhookPayload
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: PointsBoostStarted,
        timestamp: Date,
        boost: PointsBoostWebhookPayload,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.timestamp = timestamp
        self.boost = boost
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(PointsBoostStarted.self, forKey: .type)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.boost = try container.decode(PointsBoostWebhookPayload.self, forKey: .boost)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.boost, forKey: .boost)
    }

    public enum PointsBoostStarted: String, Codable, Hashable, CaseIterable, Sendable {
        case pointsBoostStarted = "points.boost_started"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case timestamp
        case boost
    }
}