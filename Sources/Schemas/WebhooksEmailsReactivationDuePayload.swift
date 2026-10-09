import Foundation

public struct WebhooksEmailsReactivationDuePayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: EmailsReactivationDue
    /// The time the webhook was sent.
    public let timestamp: Date
    /// The user the reactivation message is due for.
    public let user: User
    /// Details about the reactivation message.
    public let reactivation: WebhooksEmailsReactivationDuePayloadReactivation
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: EmailsReactivationDue,
        timestamp: Date,
        user: User,
        reactivation: WebhooksEmailsReactivationDuePayloadReactivation,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.timestamp = timestamp
        self.user = user
        self.reactivation = reactivation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(EmailsReactivationDue.self, forKey: .type)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.user = try container.decode(User.self, forKey: .user)
        self.reactivation = try container.decode(WebhooksEmailsReactivationDuePayloadReactivation.self, forKey: .reactivation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.reactivation, forKey: .reactivation)
    }

    public enum EmailsReactivationDue: String, Codable, Hashable, CaseIterable, Sendable {
        case emailsReactivationDue = "emails.reactivation_due"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case timestamp
        case user
        case reactivation
    }
}