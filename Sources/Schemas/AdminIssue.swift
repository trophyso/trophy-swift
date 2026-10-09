import Foundation

/// An issue encountered while processing an item in an admin API request.
public struct AdminIssue: Codable, Hashable, Sendable {
    /// The ID of the resource the issue relates to, when applicable.
    public let id: String?
    /// The ID of the user the issue relates to, when applicable.
    public let userId: String?
    /// The ID of the points boost the issue relates to, when applicable.
    public let boostId: String?
    /// The zero-based index of the item the issue relates to, when no resource ID exists yet.
    public let index: Int?
    /// The severity level of the issue.
    public let severity: AdminIssueSeverity
    /// A human-readable description of the issue.
    public let message: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        userId: String? = nil,
        boostId: String? = nil,
        index: Int? = nil,
        severity: AdminIssueSeverity,
        message: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.userId = userId
        self.boostId = boostId
        self.index = index
        self.severity = severity
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
        self.boostId = try container.decodeIfPresent(String.self, forKey: .boostId)
        self.index = try container.decodeIfPresent(Int.self, forKey: .index)
        self.severity = try container.decode(AdminIssueSeverity.self, forKey: .severity)
        self.message = try container.decode(String.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.boostId, forKey: .boostId)
        try container.encodeIfPresent(self.index, forKey: .index)
        try container.encode(self.severity, forKey: .severity)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case userId
        case boostId
        case index
        case severity
        case message
    }
}