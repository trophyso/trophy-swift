import Foundation

/// A leaderboard to create.
public struct CreateLeaderboardRequestItem: Codable, Hashable, Sendable {
    /// The leaderboard name.
    public let name: String
    /// The leaderboard key. Only alphanumeric characters, hyphens, and underscores are permitted.
    public let key: String
    /// The leaderboard description.
    public let description: String?
    /// The initial user-facing status. Defaults to `inactive`. Use `scheduled` for leaderboards that should be active in the future and `finished` only when creating a leaderboard with an end date in the past.
    public let status: CreateLeaderboardRequestItemStatus?
    /// What the leaderboard ranks by.
    public let rankBy: CreateLeaderboardRequestItemRankBy
    /// The metric ID to rank by when `rankBy` is `metric`.
    public let metricId: String?
    /// The points system ID to rank by when `rankBy` is `points`.
    public let pointsSystemId: String?
    /// The maximum number of participants. Defaults to `1000`.
    public let maxParticipants: Int?
    /// The leaderboard start date in YYYY-MM-DD format. Defaults to today when omitted.
    public let start: String?
    /// The optional leaderboard end date in YYYY-MM-DD format.
    public let end: String?
    /// When set, ranking only counts activity at or after this time of day in the user's timezone (HH:mm format).
    public let startTime: String?
    /// When set, ranking only counts activity before this time of day in the user's timezone (HH:mm format).
    public let endTime: String?
    /// The UUIDs of the active user attributes to break rankings down by.
    public let breakdownAttributes: [String]?
    /// How often the leaderboard repeats. Omit for a non-recurring leaderboard. Streak leaderboards cannot repeat.
    public let runUnit: CreateLeaderboardRequestItemRunUnit?
    /// The number of `runUnit`s between repeats. Required when `runUnit` is set.
    public let runInterval: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        key: String,
        description: String? = nil,
        status: CreateLeaderboardRequestItemStatus? = nil,
        rankBy: CreateLeaderboardRequestItemRankBy,
        metricId: String? = nil,
        pointsSystemId: String? = nil,
        maxParticipants: Int? = nil,
        start: String? = nil,
        end: String? = nil,
        startTime: String? = nil,
        endTime: String? = nil,
        breakdownAttributes: [String]? = nil,
        runUnit: CreateLeaderboardRequestItemRunUnit? = nil,
        runInterval: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.key = key
        self.description = description
        self.status = status
        self.rankBy = rankBy
        self.metricId = metricId
        self.pointsSystemId = pointsSystemId
        self.maxParticipants = maxParticipants
        self.start = start
        self.end = end
        self.startTime = startTime
        self.endTime = endTime
        self.breakdownAttributes = breakdownAttributes
        self.runUnit = runUnit
        self.runInterval = runInterval
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.status = try container.decodeIfPresent(CreateLeaderboardRequestItemStatus.self, forKey: .status)
        self.rankBy = try container.decode(CreateLeaderboardRequestItemRankBy.self, forKey: .rankBy)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.pointsSystemId = try container.decodeIfPresent(String.self, forKey: .pointsSystemId)
        self.maxParticipants = try container.decodeIfPresent(Int.self, forKey: .maxParticipants)
        self.start = try container.decodeIfPresent(String.self, forKey: .start)
        self.end = try container.decodeIfPresent(String.self, forKey: .end)
        self.startTime = try container.decodeIfPresent(String.self, forKey: .startTime)
        self.endTime = try container.decodeIfPresent(String.self, forKey: .endTime)
        self.breakdownAttributes = try container.decodeIfPresent([String].self, forKey: .breakdownAttributes)
        self.runUnit = try container.decodeIfPresent(CreateLeaderboardRequestItemRunUnit.self, forKey: .runUnit)
        self.runInterval = try container.decodeIfPresent(Int.self, forKey: .runInterval)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(self.rankBy, forKey: .rankBy)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.pointsSystemId, forKey: .pointsSystemId)
        try container.encodeIfPresent(self.maxParticipants, forKey: .maxParticipants)
        try container.encodeIfPresent(self.start, forKey: .start)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.startTime, forKey: .startTime)
        try container.encodeIfPresent(self.endTime, forKey: .endTime)
        try container.encodeIfPresent(self.breakdownAttributes, forKey: .breakdownAttributes)
        try container.encodeIfPresent(self.runUnit, forKey: .runUnit)
        try container.encodeIfPresent(self.runInterval, forKey: .runInterval)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case key
        case description
        case status
        case rankBy
        case metricId
        case pointsSystemId
        case maxParticipants
        case start
        case end
        case startTime
        case endTime
        case breakdownAttributes
        case runUnit
        case runInterval
    }
}