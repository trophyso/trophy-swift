import Foundation

/// A streak pause returned from the admin pauses endpoints.
public struct AdminStreakPause: Codable, Hashable, Sendable {
    /// The unique ID of the streak pause.
    public let id: String
    /// The ID of the user the pause belongs to.
    public let userId: String
    /// The first date the pause covers.
    public let start: String
    /// The last date the pause covers.
    public let end: String
    /// The status of the pause.
    public let status: AdminStreakPauseStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        userId: String,
        start: String,
        end: String,
        status: AdminStreakPauseStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.userId = userId
        self.start = start
        self.end = end
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decode(String.self, forKey: .end)
        self.status = try container.decode(AdminStreakPauseStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.start, forKey: .start)
        try container.encode(self.end, forKey: .end)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case userId
        case start
        case end
        case status
    }
}