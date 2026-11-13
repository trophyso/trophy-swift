import Foundation

/// The user's agentic messaging preferences: the channels its messages may use, and how many and what kinds of messages they want.
public struct MessagingPreferences: Codable, Hashable, Sendable {
    /// Channels agentic messages may use. An empty array turns agentic messages off for this user.
    public let channels: [NotificationChannel]?
    /// How many and what kinds of agentic messages the user wants, from 1 (fewer: progress and celebrations only, at most one email and one push a week) to 5 (more).
    public let temperature: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        channels: [NotificationChannel]? = nil,
        temperature: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.channels = channels
        self.temperature = temperature
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.channels = try container.decodeIfPresent([NotificationChannel].self, forKey: .channels)
        self.temperature = try container.decodeIfPresent(Int.self, forKey: .temperature)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.channels, forKey: .channels)
        try container.encodeIfPresent(self.temperature, forKey: .temperature)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case channels
        case temperature
    }
}