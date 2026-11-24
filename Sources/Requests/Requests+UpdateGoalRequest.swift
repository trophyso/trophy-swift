import Foundation

extension Requests {
    public struct UpdateGoalRequest: Codable, Hashable, Sendable {
        /// What the goal is, as messages name it. Null clears it.
        public let label: String?
        /// How the goal is completed. Changing it to `none` uncompletes the goal, and needs it to have a `dueAt`; changing it to `metric` needs a `metric` and `target`.
        public let completion: GoalCompletion?
        /// When the goal is due, as an ISO 8601 date and time. Without an offset, it's in the user's timezone. Null clears it, except with `completion: none`.
        public let dueAt: String?
        /// When the user completed the goal, as an ISO 8601 date and time. Without an offset, it's in the user's timezone, and a time after now is read as now. Null uncompletes it. Not with `completion: none`, which is never completed, or `completion: metric`, which completes when its metric reaches the target.
        public let completedAt: String?
        /// `completion: metric` only. The metric's key. Changing the metric, target or start checks the goal against its target again, which can complete or uncomplete it; other changes leave a completed goal completed.
        public let metric: String?
        /// `completion: metric` only. The metric total that completes it.
        public let target: Double?
        /// `completion: metric` only. The date, in the user's timezone, the metric total counts from.
        public let start: String?
        /// Replaces the goal's steps, in order: a step whose key the goal has is updated, the others are added, and steps left out are deleted. Not for a step, since steps are one level deep.
        public let steps: [GoalStepRequest]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            label: String? = nil,
            completion: GoalCompletion? = nil,
            dueAt: String? = nil,
            completedAt: String? = nil,
            metric: String? = nil,
            target: Double? = nil,
            start: String? = nil,
            steps: [GoalStepRequest]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.label = label
            self.completion = completion
            self.dueAt = dueAt
            self.completedAt = completedAt
            self.metric = metric
            self.target = target
            self.start = start
            self.steps = steps
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.label = try container.decodeIfPresent(String.self, forKey: .label)
            self.completion = try container.decodeIfPresent(GoalCompletion.self, forKey: .completion)
            self.dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt)
            self.completedAt = try container.decodeIfPresent(String.self, forKey: .completedAt)
            self.metric = try container.decodeIfPresent(String.self, forKey: .metric)
            self.target = try container.decodeIfPresent(Double.self, forKey: .target)
            self.start = try container.decodeIfPresent(String.self, forKey: .start)
            self.steps = try container.decodeIfPresent([GoalStepRequest].self, forKey: .steps)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.label, forKey: .label)
            try container.encodeIfPresent(self.completion, forKey: .completion)
            try container.encodeIfPresent(self.dueAt, forKey: .dueAt)
            try container.encodeIfPresent(self.completedAt, forKey: .completedAt)
            try container.encodeIfPresent(self.metric, forKey: .metric)
            try container.encodeIfPresent(self.target, forKey: .target)
            try container.encodeIfPresent(self.start, forKey: .start)
            try container.encodeIfPresent(self.steps, forKey: .steps)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case label
            case completion
            case dueAt
            case completedAt
            case metric
            case target
            case start
            case steps
        }
    }
}