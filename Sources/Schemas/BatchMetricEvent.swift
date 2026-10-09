import Foundation

/// A metric event submitted as part of a batch. Same shape as a single metric event, with the metric key included in the body.
public struct BatchMetricEvent: Codable, Hashable, Sendable {
    /// Unique reference of the metric as set when created.
    public let key: String
    /// The user that triggered the event.
    public let user: BatchMetricEventUser
    /// The value to add to the user's current total for the given metric.
    public let value: Double
    /// Event attributes as key-value pairs. Keys must match existing event attributes set up in the Trophy dashboard.
    public let attributes: [String: String]?
    /// Optional idempotency key for this event. When provided, the event is ignored if another event with the same idempotency key has already  been processed.
    public let idempotencyKey: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        key: String,
        user: BatchMetricEventUser,
        value: Double,
        attributes: [String: String]? = nil,
        idempotencyKey: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.key = key
        self.user = user
        self.value = value
        self.attributes = attributes
        self.idempotencyKey = idempotencyKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decode(String.self, forKey: .key)
        self.user = try container.decode(BatchMetricEventUser.self, forKey: .user)
        self.value = try container.decode(Double.self, forKey: .value)
        self.attributes = try container.decodeIfPresent([String: String].self, forKey: .attributes)
        self.idempotencyKey = try container.decodeIfPresent(String.self, forKey: .idempotencyKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.value, forKey: .value)
        try container.encodeIfPresent(self.attributes, forKey: .attributes)
        try container.encodeIfPresent(self.idempotencyKey, forKey: .idempotencyKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case key
        case user
        case value
        case attributes
        case idempotencyKey
    }
}