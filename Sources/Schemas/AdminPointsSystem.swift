import Foundation

/// A points system returned from the admin points systems endpoints.
public struct AdminPointsSystem: Codable, Hashable, Sendable {
    /// The UUID of the points system.
    public let id: String
    /// The points system name.
    public let name: String
    /// The points system key.
    public let key: String
    /// The points system description.
    public let description: String
    /// The points system status.
    public let status: AdminPointsSystemStatus
    /// The badge for the points system.
    public let badge: AdminPointsSystemBadge?
    /// The maximum points a user can earn.
    public let maxPoints: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        key: String,
        description: String,
        status: AdminPointsSystemStatus,
        badge: AdminPointsSystemBadge? = nil,
        maxPoints: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.key = key
        self.description = description
        self.status = status
        self.badge = badge
        self.maxPoints = maxPoints
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.description = try container.decode(String.self, forKey: .description)
        self.status = try container.decode(AdminPointsSystemStatus.self, forKey: .status)
        self.badge = try container.decodeIfPresent(AdminPointsSystemBadge.self, forKey: .badge)
        self.maxPoints = try container.decodeIfPresent(Int.self, forKey: .maxPoints)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.badge, forKey: .badge)
        try container.encodeIfPresent(self.maxPoints, forKey: .maxPoints)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case key
        case description
        case status
        case badge
        case maxPoints
    }
}