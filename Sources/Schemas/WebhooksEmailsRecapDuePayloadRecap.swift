import Foundation

/// Details about the recap period.
public struct WebhooksEmailsRecapDuePayloadRecap: Codable, Hashable, Sendable {
    /// The start of the recap period.
    public let periodStart: String
    /// The end of the recap period.
    public let periodEnd: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        periodStart: String,
        periodEnd: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.periodStart = try container.decode(String.self, forKey: .periodStart)
        self.periodEnd = try container.decode(String.self, forKey: .periodEnd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.periodStart, forKey: .periodStart)
        try container.encode(self.periodEnd, forKey: .periodEnd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case periodStart
        case periodEnd
    }
}