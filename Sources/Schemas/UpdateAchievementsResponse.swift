import Foundation

/// Response containing updated achievements and any per-item issues identified by achievement ID.
public struct UpdateAchievementsResponse: Codable, Hashable, Sendable {
    /// Array of successfully updated achievements.
    public let updated: [AdminAchievement]
    /// Array of issues encountered during achievement update.
    public let issues: [AdminIssue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        updated: [AdminAchievement],
        issues: [AdminIssue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.updated = updated
        self.issues = issues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.updated = try container.decode([AdminAchievement].self, forKey: .updated)
        self.issues = try container.decode([AdminIssue].self, forKey: .issues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.updated, forKey: .updated)
        try container.encode(self.issues, forKey: .issues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case updated
        case issues
    }
}