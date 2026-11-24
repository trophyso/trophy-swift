import Foundation

/// A step of a goal: a goal of its own, with its own key, one level deep. A step whose key the goal already has is updated, with fields left out staying as they are.
public struct GoalStepRequest: Codable, Hashable, Sendable {
    /// The step's key, unique per user like any goal's. 1–100 letters, numbers, hyphens or underscores, and not `plural` or `singular`.
    public let key: String
    /// What the step is, as messages name it.
    public let label: String?
    /// How the step is completed. Defaults to `manual`.
    public let completion: GoalCompletion?
    /// When the step is due, as an ISO 8601 date and time. Without an offset, it's in the user's timezone.
    public let dueAt: String?
    /// When the user completed the step, as an ISO 8601 date and time. Without an offset, it's in the user's timezone, and a time after now is read as now. Null uncompletes it. Not with `completion: none`, which is never completed, or `completion: metric`, which completes when its metric reaches the target.
    public let completedAt: String?
    /// The metric's key. Required with `completion: metric`, and only for it.
    public let metric: String?
    /// The metric total that completes it. Required with `completion: metric`, and only for it.
    public let target: Double?
    /// `completion: metric` only. The date, in the user's timezone, the metric total counts from. Defaults to today.
    public let start: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        key: String,
        label: String? = nil,
        completion: GoalCompletion? = nil,
        dueAt: String? = nil,
        completedAt: String? = nil,
        metric: String? = nil,
        target: Double? = nil,
        start: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.key = key
        self.label = label
        self.completion = completion
        self.dueAt = dueAt
        self.completedAt = completedAt
        self.metric = metric
        self.target = target
        self.start = start
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decode(String.self, forKey: .key)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.completion = try container.decodeIfPresent(GoalCompletion.self, forKey: .completion)
        self.dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt)
        self.completedAt = try container.decodeIfPresent(String.self, forKey: .completedAt)
        self.metric = try container.decodeIfPresent(String.self, forKey: .metric)
        self.target = try container.decodeIfPresent(Double.self, forKey: .target)
        self.start = try container.decodeIfPresent(String.self, forKey: .start)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.key, forKey: .key)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encodeIfPresent(self.completion, forKey: .completion)
        try container.encodeIfPresent(self.dueAt, forKey: .dueAt)
        try container.encodeIfPresent(self.completedAt, forKey: .completedAt)
        try container.encodeIfPresent(self.metric, forKey: .metric)
        try container.encodeIfPresent(self.target, forKey: .target)
        try container.encodeIfPresent(self.start, forKey: .start)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case key
        case label
        case completion
        case dueAt
        case completedAt
        case metric
        case target
        case start
    }
}