import Foundation

/// A points system update object. Only id is required; all other fields are optional.
public struct UpdatePointsSystemRequestItem: Codable, Hashable, Sendable {
    /// The UUID of the points system to update.
    public let id: String
    /// Updated name.
    public let name: String?
    /// Updated description.
    public let description: String?
    /// Updated badge. Set to null to remove.
    public let badge: UpdatePointsSystemRequestItemBadge?
    /// Updated max points. Set to null to remove.
    public let maxPoints: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String? = nil,
        description: String? = nil,
        badge: UpdatePointsSystemRequestItemBadge? = nil,
        maxPoints: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.badge = badge
        self.maxPoints = maxPoints
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.badge = try container.decodeIfPresent(UpdatePointsSystemRequestItemBadge.self, forKey: .badge)
        self.maxPoints = try container.decodeIfPresent(Int.self, forKey: .maxPoints)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.badge, forKey: .badge)
        try container.encodeIfPresent(self.maxPoints, forKey: .maxPoints)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case description
        case badge
        case maxPoints
    }
}