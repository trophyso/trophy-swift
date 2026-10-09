import Foundation

/// A user's ranking in a leaderboard.
public struct LeaderboardRanking: Codable, Hashable, Sendable {
    /// The ID of the user.
    public let userId: String
    /// The name of the user. May be null if no name is set.
    public let userName: String?
    /// The user's rank in the leaderboard.
    public let rank: Int
    /// The user's value for this leaderboard (points, metric value, etc.).
    public let value: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        userId: String,
        userName: String? = nil,
        rank: Int,
        value: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.userId = userId
        self.userName = userName
        self.rank = rank
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.userName = try container.decodeIfPresent(String.self, forKey: .userName)
        self.rank = try container.decode(Int.self, forKey: .rank)
        self.value = try container.decode(Int.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.userName, forKey: .userName)
        try container.encode(self.rank, forKey: .rank)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case userId
        case userName
        case rank
        case value
    }
}