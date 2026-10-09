import Foundation

public struct WebhooksEmailsRecapDuePayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: EmailsRecapDue
    /// The time the webhook was sent.
    public let timestamp: Date
    /// The user the recap is due for.
    public let user: User
    /// Details about the recap period.
    public let recap: WebhooksEmailsRecapDuePayloadRecap
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: EmailsRecapDue,
        timestamp: Date,
        user: User,
        recap: WebhooksEmailsRecapDuePayloadRecap,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.timestamp = timestamp
        self.user = user
        self.recap = recap
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(EmailsRecapDue.self, forKey: .type)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.user = try container.decode(User.self, forKey: .user)
        self.recap = try container.decode(WebhooksEmailsRecapDuePayloadRecap.self, forKey: .recap)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.recap, forKey: .recap)
    }

    public enum EmailsRecapDue: String, Codable, Hashable, CaseIterable, Sendable {
        case emailsRecapDue = "emails.recap_due"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case timestamp
        case user
        case recap
    }
}