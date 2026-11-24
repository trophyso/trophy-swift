import Foundation

/// A user's goal or step.
public struct GoalResponse: Codable, Hashable, Sendable {
    /// The goal's unique ID. A goal deleted and created again with the same key gets a new one.
    public let id: String
    /// The goal's key, unique per user.
    public let key: String
    /// The key of the goal it's a step of, or null if it has no parent.
    public let parent: String?
    /// What the goal is, as messages name it.
    public let label: String?
    public let completion: GoalCompletion
    /// When the goal is due, or null if it has no due time.
    public let dueAt: Date?
    /// When the user completed the goal, or null if they haven't.
    public let completedAt: Date?
    public let status: GoalStatus
    /// Its steps, in order. Empty for a goal without steps, and for a step.
    public let steps: [GoalResponse]
    /// How many of its steps are completed.
    public let done: Int
    /// How many steps it has.
    public let total: Int
    /// `completion: metric` only. The metric's key.
    public let metric: String?
    /// `completion: metric` only. The metric total that completes it.
    public let target: Double?
    /// `completion: metric` only. The date, in the user's timezone, the metric total counts from.
    public let start: String?
    /// `completion: metric` only. The metric total since `start`.
    public let current: Double?
    /// When the goal was created.
    public let created: Date
    /// When the goal was last changed.
    public let updated: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        key: String,
        parent: String? = nil,
        label: String? = nil,
        completion: GoalCompletion,
        dueAt: Date? = nil,
        completedAt: Date? = nil,
        status: GoalStatus,
        steps: [GoalResponse],
        done: Int,
        total: Int,
        metric: String? = nil,
        target: Double? = nil,
        start: String? = nil,
        current: Double? = nil,
        created: Date,
        updated: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.key = key
        self.parent = parent
        self.label = label
        self.completion = completion
        self.dueAt = dueAt
        self.completedAt = completedAt
        self.status = status
        self.steps = steps
        self.done = done
        self.total = total
        self.metric = metric
        self.target = target
        self.start = start
        self.current = current
        self.created = created
        self.updated = updated
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.key = try container.decode(String.self, forKey: .key)
        self.parent = try container.decodeIfPresent(String.self, forKey: .parent)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.completion = try container.decode(GoalCompletion.self, forKey: .completion)
        self.dueAt = try container.decodeIfPresent(Date.self, forKey: .dueAt)
        self.completedAt = try container.decodeIfPresent(Date.self, forKey: .completedAt)
        self.status = try container.decode(GoalStatus.self, forKey: .status)
        self.steps = try container.decode([GoalResponse].self, forKey: .steps)
        self.done = try container.decode(Int.self, forKey: .done)
        self.total = try container.decode(Int.self, forKey: .total)
        self.metric = try container.decodeIfPresent(String.self, forKey: .metric)
        self.target = try container.decodeIfPresent(Double.self, forKey: .target)
        self.start = try container.decodeIfPresent(String.self, forKey: .start)
        self.current = try container.decodeIfPresent(Double.self, forKey: .current)
        self.created = try container.decode(Date.self, forKey: .created)
        self.updated = try container.decode(Date.self, forKey: .updated)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.key, forKey: .key)
        try container.encodeIfPresent(self.parent, forKey: .parent)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encode(self.completion, forKey: .completion)
        try container.encodeIfPresent(self.dueAt, forKey: .dueAt)
        try container.encodeIfPresent(self.completedAt, forKey: .completedAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.steps, forKey: .steps)
        try container.encode(self.done, forKey: .done)
        try container.encode(self.total, forKey: .total)
        try container.encodeIfPresent(self.metric, forKey: .metric)
        try container.encodeIfPresent(self.target, forKey: .target)
        try container.encodeIfPresent(self.start, forKey: .start)
        try container.encodeIfPresent(self.current, forKey: .current)
        try container.encode(self.created, forKey: .created)
        try container.encode(self.updated, forKey: .updated)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case key
        case parent
        case label
        case completion
        case dueAt
        case completedAt
        case status
        case steps
        case done
        case total
        case metric
        case target
        case start
        case current
        case created
        case updated
    }
}