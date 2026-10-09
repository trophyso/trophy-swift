import Foundation

/// Per-user streak configuration. Metric, evaluation mode, and days off overrides require streak customization to be enabled in dashboard settings.
public struct StreakPreferences: Codable, Hashable, Sendable {
    /// Whether streaks are calculated for this user. When false, the user's streak is always 0 and streak webhooks and notifications are not sent.
    public let enabled: Bool?
    public let evaluationMode: StreakEvaluationModePreference?
    /// Metrics and thresholds that count toward this user's streak.
    public let metrics: [StreakMetricPreference]?
    /// Days of the week that do not count toward the user's daily streak. Represented as zero-based integers matching JavaScript `Date.getDay()` (0 = Sunday, 6 = Saturday). For example, `[0, 6]` means Sunday and Saturday are days off. Only applied when streak frequency is daily. Users can still increase their streak on these days; if they do not, the streak stays paused at its current length instead of being lost.
    public let daysOff: [Int]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enabled: Bool? = nil,
        evaluationMode: StreakEvaluationModePreference? = nil,
        metrics: [StreakMetricPreference]? = nil,
        daysOff: [Int]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enabled = enabled
        self.evaluationMode = evaluationMode
        self.metrics = metrics
        self.daysOff = daysOff
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.evaluationMode = try container.decodeIfPresent(StreakEvaluationModePreference.self, forKey: .evaluationMode)
        self.metrics = try container.decodeIfPresent([StreakMetricPreference].self, forKey: .metrics)
        self.daysOff = try container.decodeIfPresent([Int].self, forKey: .daysOff)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.evaluationMode, forKey: .evaluationMode)
        try container.encodeIfPresent(self.metrics, forKey: .metrics)
        try container.encodeIfPresent(self.daysOff, forKey: .daysOff)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case evaluationMode
        case metrics
        case daysOff
    }
}