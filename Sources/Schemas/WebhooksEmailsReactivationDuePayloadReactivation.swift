import Foundation

/// Details about the reactivation message.
public struct WebhooksEmailsReactivationDuePayloadReactivation: Codable, Hashable, Sendable {
    /// The reactivation message number in the sequence.
    public let messageNumber: Int
    /// The number of days since the user was last active.
    public let daysSinceLastActive: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messageNumber: Int,
        daysSinceLastActive: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messageNumber = messageNumber
        self.daysSinceLastActive = daysSinceLastActive
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messageNumber = try container.decode(Int.self, forKey: .messageNumber)
        self.daysSinceLastActive = try container.decode(Int.self, forKey: .daysSinceLastActive)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.messageNumber, forKey: .messageNumber)
        try container.encode(self.daysSinceLastActive, forKey: .daysSinceLastActive)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messageNumber
        case daysSinceLastActive
    }
}