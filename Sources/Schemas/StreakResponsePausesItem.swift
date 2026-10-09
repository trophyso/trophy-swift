import Foundation

/// An object representing a streak pause.
public struct StreakResponsePausesItem: Codable, Hashable, Sendable {
    /// The unique ID of the streak pause.
    public let id: String
    /// The first date the pause covers.
    public let start: String
    /// The last date the pause covers.
    public let end: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        start: String,
        end: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.start = start
        self.end = end
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decode(String.self, forKey: .end)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.start, forKey: .start)
        try container.encode(self.end, forKey: .end)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case start
        case end
    }
}