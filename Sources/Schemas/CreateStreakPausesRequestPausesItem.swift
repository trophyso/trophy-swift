import Foundation

public struct CreateStreakPausesRequestPausesItem: Codable, Hashable, Sendable {
    /// The ID of the user to create a pause for.
    public let userId: String
    /// The first date the pause covers, in YYYY-MM-DD format. Must not be before today in the user's timezone.
    public let start: String
    /// The last date the pause covers, in YYYY-MM-DD format. Must be on or after start.
    public let end: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        userId: String,
        start: String,
        end: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.userId = userId
        self.start = start
        self.end = end
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decode(String.self, forKey: .end)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.start, forKey: .start)
        try container.encode(self.end, forKey: .end)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case userId
        case start
        case end
    }
}