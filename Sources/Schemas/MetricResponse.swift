import Foundation

public struct MetricResponse: Codable, Hashable, Sendable {
    /// The unique ID of the metric.
    public let id: String
    /// The unique key of the metric.
    public let key: String
    /// The name of the metric.
    public let name: String
    /// The user's current total for the metric.
    public let current: Double
    /// A list of the metric's achievements and the user's progress towards each.
    public let achievements: [UserAchievementResponse]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        key: String,
        name: String,
        current: Double,
        achievements: [UserAchievementResponse],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.key = key
        self.name = name
        self.current = current
        self.achievements = achievements
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.current = try container.decode(Double.self, forKey: .current)
        self.achievements = try container.decode([UserAchievementResponse].self, forKey: .achievements)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.current, forKey: .current)
        try container.encode(self.achievements, forKey: .achievements)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case key
        case name
        case current
        case achievements
    }
}