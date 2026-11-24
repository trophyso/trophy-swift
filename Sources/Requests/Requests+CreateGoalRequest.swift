import Foundation

extension Requests {
    public struct CreateGoalRequest: Codable, Hashable, Sendable {
        /// The goal's key, unique per user. 1–100 letters, numbers, hyphens or underscores, and not `plural` or `singular`.
        public let key: String
        /// The key of a goal to add this to as a step, after its last. The parent can't be a step, can't have more than 100 steps, and the request can't have `steps`.
        public let parent: String?
        /// What the goal is, as messages name it, e.g. "Spanish B1 exam".
        public let label: String?
        /// How the goal is completed. Defaults to `manual`.
        public let completion: GoalCompletion?
        /// When the goal is due, as an ISO 8601 date and time. Without an offset, it's in the user's timezone. Required with `completion: none`.
        public let dueAt: String?
        /// When the user completed the goal, if they already have, as an ISO 8601 date and time. Without an offset, it's in the user's timezone, and a time after now is read as now. Not with `completion: none`, which is never completed, or `completion: metric`, which completes when its metric reaches the target.
        public let completedAt: String?
        /// The metric's key. Required with `completion: metric`, and only for it.
        public let metric: String?
        /// The metric total that completes it. Required with `completion: metric`, and only for it.
        public let target: Double?
        /// `completion: metric` only. The date, in the user's timezone, the metric total counts from. Defaults to today.
        public let start: String?
        /// The goal's steps, in order, each with its own key.
        public let steps: [GoalStepRequest]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            key: String,
            parent: String? = nil,
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
            self.key = key
            self.parent = parent
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
            self.key = try container.decode(String.self, forKey: .key)
            self.parent = try container.decodeIfPresent(String.self, forKey: .parent)
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
            try container.encode(self.key, forKey: .key)
            try container.encodeIfPresent(self.parent, forKey: .parent)
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
            case key
            case parent
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