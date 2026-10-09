import Foundation

/// Response containing users whose streaks were reset and any issues encountered.
public struct ResetStreaksResponse: Codable, Hashable, Sendable {
    /// Array of user IDs whose streaks were successfully reset to zero.
    public let resetUsers: [String]
    /// Array of issues encountered during streak reset.
    public let issues: [AdminIssue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        resetUsers: [String],
        issues: [AdminIssue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.resetUsers = resetUsers
        self.issues = issues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resetUsers = try container.decode([String].self, forKey: .resetUsers)
        self.issues = try container.decode([AdminIssue].self, forKey: .issues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.resetUsers, forKey: .resetUsers)
        try container.encode(self.issues, forKey: .issues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case resetUsers
        case issues
    }
}