import Foundation

extension Requests {
    public struct UpdateStreakSettingsRequest: Codable, Hashable, Sendable {
        public let frequency: AdminStreakFrequency?
        public let evaluationMode: AdminStreakEvaluationMode?
        /// Whether users can override streak evaluation mode, metric thresholds, and days off via preferences.
        public let customizationEnabled: Bool?
        /// Days of the week that do not count toward the daily streak. A non-empty array is only allowed when the resulting frequency is `daily`. Changing frequency away from `daily` clears stored days off even when this field is omitted.
        public let daysOff: [Int]?
        /// Replacement list of streak metrics. Keys must be unique and must exist on the organization.
        public let metrics: [StreakSettingsMetric]?
        /// Replacement freeze configuration, or `null` to disable freezes.
        public let freezes: UpdateStreakSettingsFreezes?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            frequency: AdminStreakFrequency? = nil,
            evaluationMode: AdminStreakEvaluationMode? = nil,
            customizationEnabled: Bool? = nil,
            daysOff: [Int]? = nil,
            metrics: [StreakSettingsMetric]? = nil,
            freezes: UpdateStreakSettingsFreezes? = nil,
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
            self.frequency = try container.decodeIfPresent(AdminStreakFrequency.self, forKey: .frequency)
            self.evaluationMode = try container.decodeIfPresent(AdminStreakEvaluationMode.self, forKey: .evaluationMode)
            self.customizationEnabled = try container.decodeIfPresent(Bool.self, forKey: .customizationEnabled)
            self.daysOff = try container.decodeIfPresent([Int].self, forKey: .daysOff)
            self.metrics = try container.decodeIfPresent([StreakSettingsMetric].self, forKey: .metrics)
            self.freezes = try container.decodeIfPresent(UpdateStreakSettingsFreezes.self, forKey: .freezes)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.frequency, forKey: .frequency)
            try container.encodeIfPresent(self.evaluationMode, forKey: .evaluationMode)
            try container.encodeIfPresent(self.customizationEnabled, forKey: .customizationEnabled)
            try container.encodeIfPresent(self.daysOff, forKey: .daysOff)
            try container.encodeIfPresent(self.metrics, forKey: .metrics)
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
}