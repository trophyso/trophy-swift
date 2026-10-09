import Foundation

/// Response containing restored users and any issues encountered.
public struct RestoreStreaksResponse: Codable, Hashable, Sendable {
    /// Array of user IDs whose streaks were successfully restored.
    public let restoredUsers: [String]
    /// Array of issues encountered during streak restoration.
    public let issues: [AdminIssue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        restoredUsers: [String],
        issues: [AdminIssue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.restoredUsers = restoredUsers
        self.issues = issues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.restoredUsers = try container.decode([String].self, forKey: .restoredUsers)
        self.issues = try container.decode([AdminIssue].self, forKey: .issues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.restoredUsers, forKey: .restoredUsers)
        try container.encode(self.issues, forKey: .issues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case restoredUsers
        case issues
    }
}