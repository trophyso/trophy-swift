import Foundation

/// A user's data for a specific leaderboard including rank, value, and history.
public struct WebhookUserLeaderboardResponse: Codable, Hashable, Sendable {
    /// The user's current rank in this leaderboard. Null if the user is not on the leaderboard.
    public let rank: Int?
    /// The user's current value in this leaderboard. Null if the user is not on the leaderboard.
    public let value: Int?
    /// The unique ID of the leaderboard.
    public let id: String
    /// The user-facing name of the leaderboard.
    public let name: String
    /// The unique key used to reference the leaderboard in APIs.
    public let key: String
    /// What the leaderboard ranks by.
    public let rankBy: LeaderboardResponseRankBy
    /// Deprecated. The key of the attribute to break down this leaderboard by.
    public let breakdownAttribute: String?
    /// The user attribute keys that this leaderboard is broken down by.
    public let breakdownAttributes: [String]
    /// The key of the metric to rank by, if rankBy is 'metric'.
    public let metricKey: String?
    /// The name of the metric to rank by, if rankBy is 'metric'.
    public let metricName: String?
    /// The key of the points system to rank by, if rankBy is 'points'.
    public let pointsSystemKey: String?
    /// The name of the points system to rank by, if rankBy is 'points'.
    public let pointsSystemName: String?
    /// The user-facing description of the leaderboard.
    public let description: String?
    /// The start date of the leaderboard in YYYY-MM-DD format.
    public let start: String
    /// The end date of the leaderboard in YYYY-MM-DD format, or null if it runs forever.
    public let end: String?
    /// When set, ranking only counts activity at or after this time of day in the user's timezone (HH:mm format).
    public let startTime: String?
    /// When set, ranking only counts activity before this time of day in the user's timezone (HH:mm format).
    public let endTime: String?
    /// The maximum number of participants in the leaderboard.
    public let maxParticipants: Int?
    /// The repetition type for recurring leaderboards, or null for one-time leaderboards.
    public let runUnit: LeaderboardResponseRunUnit?
    /// The interval between repetitions, relative to the start date and repetition type. Null for one-time leaderboards.
    public let runInterval: Int?
    /// The user's rank before this event, or null if they were not on the leaderboard.
    public let previousRank: Int?
    /// The user's value before this event, or null if they were not on the leaderboard.
    public let previousValue: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        rank: Int? = nil,
        value: Int? = nil,
        id: String,
        name: String,
        key: String,
        rankBy: LeaderboardResponseRankBy,
        breakdownAttribute: String? = nil,
        breakdownAttributes: [String],
        metricKey: String? = nil,
        metricName: String? = nil,
        pointsSystemKey: String? = nil,
        pointsSystemName: String? = nil,
        description: String? = nil,
        start: String,
        end: String? = nil,
        startTime: String? = nil,
        endTime: String? = nil,
        maxParticipants: Int? = nil,
        runUnit: LeaderboardResponseRunUnit? = nil,
        runInterval: Int? = nil,
        previousRank: Int? = nil,
        previousValue: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.rank = rank
        self.value = value
        self.id = id
        self.name = name
        self.key = key
        self.rankBy = rankBy
        self.breakdownAttribute = breakdownAttribute
        self.breakdownAttributes = breakdownAttributes
        self.metricKey = metricKey
        self.metricName = metricName
        self.pointsSystemKey = pointsSystemKey
        self.pointsSystemName = pointsSystemName
        self.description = description
        self.start = start
        self.end = end
        self.startTime = startTime
        self.endTime = endTime
        self.maxParticipants = maxParticipants
        self.runUnit = runUnit
        self.runInterval = runInterval
        self.previousRank = previousRank
        self.previousValue = previousValue
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        self.value = try container.decodeIfPresent(Int.self, forKey: .value)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.rankBy = try container.decode(LeaderboardResponseRankBy.self, forKey: .rankBy)
        self.breakdownAttribute = try container.decodeIfPresent(String.self, forKey: .breakdownAttribute)
        self.breakdownAttributes = try container.decode([String].self, forKey: .breakdownAttributes)
        self.metricKey = try container.decodeIfPresent(String.self, forKey: .metricKey)
        self.metricName = try container.decodeIfPresent(String.self, forKey: .metricName)
        self.pointsSystemKey = try container.decodeIfPresent(String.self, forKey: .pointsSystemKey)
        self.pointsSystemName = try container.decodeIfPresent(String.self, forKey: .pointsSystemName)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decodeIfPresent(String.self, forKey: .end)
        self.startTime = try container.decodeIfPresent(String.self, forKey: .startTime)
        self.endTime = try container.decodeIfPresent(String.self, forKey: .endTime)
        self.maxParticipants = try container.decodeIfPresent(Int.self, forKey: .maxParticipants)
        self.runUnit = try container.decodeIfPresent(LeaderboardResponseRunUnit.self, forKey: .runUnit)
        self.runInterval = try container.decodeIfPresent(Int.self, forKey: .runInterval)
        self.previousRank = try container.decodeIfPresent(Int.self, forKey: .previousRank)
        self.previousValue = try container.decodeIfPresent(Int.self, forKey: .previousValue)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.rank, forKey: .rank)
        try container.encodeIfPresent(self.value, forKey: .value)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.rankBy, forKey: .rankBy)
        try container.encodeIfPresent(self.breakdownAttribute, forKey: .breakdownAttribute)
        try container.encode(self.breakdownAttributes, forKey: .breakdownAttributes)
        try container.encodeIfPresent(self.metricKey, forKey: .metricKey)
        try container.encodeIfPresent(self.metricName, forKey: .metricName)
        try container.encodeIfPresent(self.pointsSystemKey, forKey: .pointsSystemKey)
        try container.encodeIfPresent(self.pointsSystemName, forKey: .pointsSystemName)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.start, forKey: .start)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.startTime, forKey: .startTime)
        try container.encodeIfPresent(self.endTime, forKey: .endTime)
        try container.encodeIfPresent(self.maxParticipants, forKey: .maxParticipants)
        try container.encodeIfPresent(self.runUnit, forKey: .runUnit)
        try container.encodeIfPresent(self.runInterval, forKey: .runInterval)
        try container.encodeIfPresent(self.previousRank, forKey: .previousRank)
        try container.encodeIfPresent(self.previousValue, forKey: .previousValue)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case rank
        case value
        case id
        case name
        case key
        case rankBy
        case breakdownAttribute
        case breakdownAttributes
        case metricKey
        case metricName
        case pointsSystemKey
        case pointsSystemName
        case description
        case start
        case end
        case startTime
        case endTime
        case maxParticipants
        case runUnit
        case runInterval
        case previousRank
        case previousValue
    }
}