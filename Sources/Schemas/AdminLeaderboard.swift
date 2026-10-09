import Foundation

/// A leaderboard returned from the admin leaderboards endpoints.
public struct AdminLeaderboard: Codable, Hashable, Sendable {
    /// The UUID of the leaderboard.
    public let id: String
    /// The leaderboard name.
    public let name: String
    /// The leaderboard key.
    public let key: String
    /// The leaderboard description.
    public let description: String?
    /// The current user-facing status of the leaderboard.
    public let status: AdminLeaderboardStatus
    /// What the leaderboard ranks by.
    public let rankBy: AdminLeaderboardRankBy
    /// The metric ID used when `rankBy` is `metric`.
    public let metricId: String?
    /// The points system ID used when `rankBy` is `points`.
    public let pointsSystemId: String?
    /// The maximum number of participants.
    public let maxParticipants: Int?
    /// The leaderboard start date in YYYY-MM-DD format.
    public let start: String
    /// The optional leaderboard end date in YYYY-MM-DD format.
    public let end: String?
    /// When set, ranking only counts activity at or after this time of day in the user's timezone (HH:mm format).
    public let startTime: String?
    /// When set, ranking only counts activity before this time of day in the user's timezone (HH:mm format).
    public let endTime: String?
    /// The UUIDs of the user attributes used for ranking breakdowns.
    public let breakdownAttributes: [String]
    /// The recurrence unit when the leaderboard repeats.
    public let runUnit: AdminLeaderboardRunUnit?
    /// The number of recurrence units between leaderboard runs.
    public let runInterval: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        key: String,
        description: String? = nil,
        status: AdminLeaderboardStatus,
        rankBy: AdminLeaderboardRankBy,
        metricId: String? = nil,
        pointsSystemId: String? = nil,
        maxParticipants: Int? = nil,
        start: String,
        end: String? = nil,
        startTime: String? = nil,
        endTime: String? = nil,
        breakdownAttributes: [String],
        runUnit: AdminLeaderboardRunUnit? = nil,
        runInterval: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
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
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.status = try container.decode(AdminLeaderboardStatus.self, forKey: .status)
        self.rankBy = try container.decode(AdminLeaderboardRankBy.self, forKey: .rankBy)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.pointsSystemId = try container.decodeIfPresent(String.self, forKey: .pointsSystemId)
        self.maxParticipants = try container.decodeIfPresent(Int.self, forKey: .maxParticipants)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decodeIfPresent(String.self, forKey: .end)
        self.startTime = try container.decodeIfPresent(String.self, forKey: .startTime)
        self.endTime = try container.decodeIfPresent(String.self, forKey: .endTime)
        self.breakdownAttributes = try container.decode([String].self, forKey: .breakdownAttributes)
        self.runUnit = try container.decodeIfPresent(AdminLeaderboardRunUnit.self, forKey: .runUnit)
        self.runInterval = try container.decodeIfPresent(Int.self, forKey: .runInterval)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.rankBy, forKey: .rankBy)
        try container.encodeIfPresent(self.metricId, forKey: .metricId)
        try container.encodeIfPresent(self.pointsSystemId, forKey: .pointsSystemId)
        try container.encodeIfPresent(self.maxParticipants, forKey: .maxParticipants)
        try container.encode(self.start, forKey: .start)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.startTime, forKey: .startTime)
        try container.encodeIfPresent(self.endTime, forKey: .endTime)
        try container.encode(self.breakdownAttributes, forKey: .breakdownAttributes)
        try container.encodeIfPresent(self.runUnit, forKey: .runUnit)
        try container.encodeIfPresent(self.runInterval, forKey: .runInterval)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
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