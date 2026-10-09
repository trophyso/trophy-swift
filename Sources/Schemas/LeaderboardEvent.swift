import Foundation

/// A daily leaderboard snapshot entry representing the user's rank/value state and the previous persisted state.
public struct LeaderboardEvent: Codable, Hashable, Sendable {
    /// The leaderboard snapshot date in YYYY-MM-DD format.
    public let date: String
    /// Deprecated ISO timestamp for the snapshot day boundary. Use `date` instead.
    public let timestamp: Date
    /// The user's rank before this event, or null if they were not on the leaderboard.
    public let previousRank: Int?
    /// The user's rank after this event, or null if they are no longer on the leaderboard.
    public let rank: Int?
    /// The user's value before this event, or null if they were not on the leaderboard.
    public let previousValue: Int?
    /// The user's value after this event, or null if they are no longer on the leaderboard.
    public let value: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: String,
        timestamp: Date,
        previousRank: Int? = nil,
        rank: Int? = nil,
        previousValue: Int? = nil,
        value: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.date = date
        self.timestamp = timestamp
        self.previousRank = previousRank
        self.rank = rank
        self.previousValue = previousValue
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.previousRank = try container.decodeIfPresent(Int.self, forKey: .previousRank)
        self.rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        self.previousValue = try container.decodeIfPresent(Int.self, forKey: .previousValue)
        self.value = try container.decodeIfPresent(Int.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.previousRank, forKey: .previousRank)
        try container.encodeIfPresent(self.rank, forKey: .rank)
        try container.encodeIfPresent(self.previousValue, forKey: .previousValue)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date
        case timestamp
        case previousRank
        case rank
        case previousValue
        case value
    }
}