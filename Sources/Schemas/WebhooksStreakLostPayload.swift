import Foundation

public struct WebhooksStreakLostPayload: Codable, Hashable, Sendable {
    /// The webhook event type.
    public let type: StreakLost
    /// The user who lost the streak.
    public let user: User
    /// The length of the streak that was lost.
    public let length: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: StreakLost,
        user: User,
        length: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.user = user
        self.length = length
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(StreakLost.self, forKey: .type)
        self.user = try container.decode(User.self, forKey: .user)
        self.length = try container.decode(Int.self, forKey: .length)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.length, forKey: .length)
    }

    public enum StreakLost: String, Codable, Hashable, CaseIterable, Sendable {
        case streakLost = "streak.lost"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case user
        case length
    }
}