import Foundation

/// Response containing created attributes and any per-item issues.
public struct CreateAttributesResponse: Codable, Hashable, Sendable {
    /// Array of successfully created attributes.
    public let created: [AdminAttribute]
    /// Array of issues encountered during attribute creation.
    public let issues: [AdminIssue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        created: [AdminAttribute],
        issues: [AdminIssue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.created = created
        self.issues = issues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.created = try container.decode([AdminAttribute].self, forKey: .created)
        self.issues = try container.decode([AdminIssue].self, forKey: .issues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.created, forKey: .created)
        try container.encode(self.issues, forKey: .issues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case created
        case issues
    }
}