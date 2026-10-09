import Foundation

/// A leaderboard update object. `id` is required. Once a leaderboard has been activated, the dashboard-imposed restrictions on ranking configuration and scheduling changes still apply.
public struct UpdateLeaderboardRequestItem: Codable, Hashable, Sendable {
    /// The UUID of the leaderboard to update.
    public let id: String
    /// The updated leaderboard name.
    public let name: String?
    /// The updated leaderboard key. This can only be changed while the leaderboard is inactive.
    public let key: String?
    /// The updated leaderboard description.
    public let description: String?
    /// The target user-facing status. `scheduled` activates a leaderboard whose start date is in the future. `finished` behaves like the dashboard finish action.
    public let status: UpdateLeaderboardRequestItemStatus?
    /// The updated ranking criterion. This can only be changed while the leaderboard is inactive.
    public let rankBy: UpdateLeaderboardRequestItemRankBy?
    /// The metric ID to use when `rankBy` is `metric`.
    public let metricId: String?
    /// The points system ID to use when `rankBy` is `points`.
    public let pointsSystemId: String?
    /// The updated maximum number of participants.
    public let maxParticipants: Int?
    /// The updated start date in YYYY-MM-DD format.
    public let start: String?
    /// The updated end date in YYYY-MM-DD format, or `null` to clear it.
    public let end: String?
    /// The updated start of the daily ranking time window in HH:mm format, or `null` to clear it.
    public let startTime: String?
    /// The updated end of the daily ranking time window in HH:mm format, or `null` to clear it.
    public let endTime: String?
    /// The updated breakdown attribute UUIDs.
    public let breakdownAttributes: [String]?
    /// The updated recurrence unit.
    public let runUnit: UpdateLeaderboardRequestItemRunUnit?
    /// The updated recurrence interval.
    public let runInterval: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String? = nil,
        key: String? = nil,
        description: String? = nil,
        status: UpdateLeaderboardRequestItemStatus? = nil,
        rankBy: UpdateLeaderboardRequestItemRankBy? = nil,
        metricId: String? = nil,
        pointsSystemId: String? = nil,
        maxParticipants: Int? = nil,
        start: String? = nil,
        end: String? = nil,
        startTime: String? = nil,
        endTime: String? = nil,
        breakdownAttributes: [String]? = nil,
        runUnit: UpdateLeaderboardRequestItemRunUnit? = nil,
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
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.status = try container.decodeIfPresent(UpdateLeaderboardRequestItemStatus.self, forKey: .status)
        self.rankBy = try container.decodeIfPresent(UpdateLeaderboardRequestItemRankBy.self, forKey: .rankBy)
        self.metricId = try container.decodeIfPresent(String.self, forKey: .metricId)
        self.pointsSystemId = try container.decodeIfPresent(String.self, forKey: .pointsSystemId)
        self.maxParticipants = try container.decodeIfPresent(Int.self, forKey: .maxParticipants)
        self.start = try container.decodeIfPresent(String.self, forKey: .start)
        self.end = try container.decodeIfPresent(String.self, forKey: .end)
        self.startTime = try container.decodeIfPresent(String.self, forKey: .startTime)
        self.endTime = try container.decodeIfPresent(String.self, forKey: .endTime)
        self.breakdownAttributes = try container.decodeIfPresent([String].self, forKey: .breakdownAttributes)
        self.runUnit = try container.decodeIfPresent(UpdateLeaderboardRequestItemRunUnit.self, forKey: .runUnit)
        self.runInterval = try container.decodeIfPresent(Int.self, forKey: .runInterval)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.rankBy, forKey: .rankBy)
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