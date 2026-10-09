import Foundation

/// Response containing the points boosts that were deleted and any per-item issues.
public struct DeletePointsBoostsResponse: Codable, Hashable, Sendable {
    /// Array of deleted points boosts represented by ID.
    public let deleted: [DeletedResource]
    /// Array of issues encountered during boost deletion.
    public let issues: [AdminIssue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        deleted: [DeletedResource],
        issues: [AdminIssue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.deleted = deleted
        self.issues = issues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.deleted = try container.decode([DeletedResource].self, forKey: .deleted)
        self.issues = try container.decode([AdminIssue].self, forKey: .issues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.deleted, forKey: .deleted)
        try container.encode(self.issues, forKey: .issues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case deleted
        case issues
    }
}