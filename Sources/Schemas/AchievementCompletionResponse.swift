import Foundation

public struct AchievementCompletionResponse: Codable, Hashable, Sendable {
    /// The unique ID of the completion.
    public let completionId: String
    public let achievement: UserAchievementResponse
    /// A map of points systems by key that were affected by this achievement completion.
    public let points: [String: MetricEventPointsResponse]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        completionId: String,
        achievement: UserAchievementResponse,
        points: [String: MetricEventPointsResponse],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.completionId = completionId
        self.achievement = achievement
        self.points = points
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.completionId = try container.decode(String.self, forKey: .completionId)
        self.achievement = try container.decode(UserAchievementResponse.self, forKey: .achievement)
        self.points = try container.decode([String: MetricEventPointsResponse].self, forKey: .points)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.completionId, forKey: .completionId)
        try container.encode(self.achievement, forKey: .achievement)
        try container.encode(self.points, forKey: .points)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case completionId
        case achievement
        case points
    }
}