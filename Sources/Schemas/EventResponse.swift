import Foundation

public struct EventResponse: Codable, Hashable, Sendable {
    /// The unique ID of the event.
    public let eventId: String
    /// The unique ID of the metric that was updated.
    public let metricId: String
    /// The user's new total progress against the metric.
    public let total: Double
    /// Achievements completed as a result of this event.
    public let achievements: [UserAchievementResponse]
    /// The user's current streak.
    public let currentStreak: MetricEventStreakResponse
    /// A map of points systems by key. Only contains points systems that were affected by the event.
    public let points: [String: MetricEventPointsResponse]
    /// A map of leaderboards by key. Only contains leaderboards that were affected by the event.
    public let leaderboards: [String: MetricEventLeaderboardResponse]
    /// The idempotency key used for the event, if one was provided.
    public let idempotencyKey: String?
    /// Whether the event was replayed due to idempotency.
    public let idempotentReplayed: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        eventId: String,
        metricId: String,
        total: Double,
        achievements: [UserAchievementResponse],
        currentStreak: MetricEventStreakResponse,
        points: [String: MetricEventPointsResponse],
        leaderboards: [String: MetricEventLeaderboardResponse],
        idempotencyKey: String? = nil,
        idempotentReplayed: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.eventId = eventId
        self.metricId = metricId
        self.total = total
        self.achievements = achievements
        self.currentStreak = currentStreak
        self.points = points
        self.leaderboards = leaderboards
        self.idempotencyKey = idempotencyKey
        self.idempotentReplayed = idempotentReplayed
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.eventId = try container.decode(String.self, forKey: .eventId)
        self.metricId = try container.decode(String.self, forKey: .metricId)
        self.total = try container.decode(Double.self, forKey: .total)
        self.achievements = try container.decode([UserAchievementResponse].self, forKey: .achievements)
        self.currentStreak = try container.decode(MetricEventStreakResponse.self, forKey: .currentStreak)
        self.points = try container.decode([String: MetricEventPointsResponse].self, forKey: .points)
        self.leaderboards = try container.decode([String: MetricEventLeaderboardResponse].self, forKey: .leaderboards)
        self.idempotencyKey = try container.decodeIfPresent(String.self, forKey: .idempotencyKey)
        self.idempotentReplayed = try container.decodeIfPresent(Bool.self, forKey: .idempotentReplayed)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.eventId, forKey: .eventId)
        try container.encode(self.metricId, forKey: .metricId)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.achievements, forKey: .achievements)
        try container.encode(self.currentStreak, forKey: .currentStreak)
        try container.encode(self.points, forKey: .points)
        try container.encode(self.leaderboards, forKey: .leaderboards)
        try container.encodeIfPresent(self.idempotencyKey, forKey: .idempotencyKey)
        try container.encodeIfPresent(self.idempotentReplayed, forKey: .idempotentReplayed)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case eventId
        case metricId
        case total
        case achievements
        case currentStreak
        case points
        case leaderboards
        case idempotencyKey
        case idempotentReplayed
    }
}