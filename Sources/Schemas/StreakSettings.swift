import Foundation

/// The organization's streak configuration.
public struct StreakSettings: Codable, Hashable, Sendable {
    public let frequency: AdminStreakFrequency
    public let evaluationMode: AdminStreakEvaluationMode
    /// Whether users can override streak evaluation mode, metric thresholds, and days off via preferences.
    public let customizationEnabled: Bool
    /// Days of the week that do not count toward the daily streak. Represented as zero-based integers matching JavaScript `Date.getDay()` (0 = Sunday, 6 = Saturday).
    public let daysOff: [Int]
    /// Metrics with a streak threshold greater than zero.
    public let metrics: [StreakSettingsMetric]
    /// Freeze configuration, or `null` when streak freezes are disabled.
    public let freezes: StreakSettingsFreezes?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        frequency: AdminStreakFrequency,
        evaluationMode: AdminStreakEvaluationMode,
        customizationEnabled: Bool,
        daysOff: [Int],
        metrics: [StreakSettingsMetric],
        freezes: StreakSettingsFreezes? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.frequency = frequency
        self.evaluationMode = evaluationMode
        self.customizationEnabled = customizationEnabled
        self.daysOff = daysOff
        self.metrics = metrics
        self.freezes = freezes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frequency = try container.decode(AdminStreakFrequency.self, forKey: .frequency)
        self.evaluationMode = try container.decode(AdminStreakEvaluationMode.self, forKey: .evaluationMode)
        self.customizationEnabled = try container.decode(Bool.self, forKey: .customizationEnabled)
        self.daysOff = try container.decode([Int].self, forKey: .daysOff)
        self.metrics = try container.decode([StreakSettingsMetric].self, forKey: .metrics)
        self.freezes = try container.decodeIfPresent(StreakSettingsFreezes.self, forKey: .freezes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.frequency, forKey: .frequency)
        try container.encode(self.evaluationMode, forKey: .evaluationMode)
        try container.encode(self.customizationEnabled, forKey: .customizationEnabled)
        try container.encode(self.daysOff, forKey: .daysOff)
        try container.encode(self.metrics, forKey: .metrics)
        try container.encodeIfPresent(self.freezes, forKey: .freezes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case frequency
        case evaluationMode
        case customizationEnabled
        case daysOff
        case metrics
        case freezes
    }
}