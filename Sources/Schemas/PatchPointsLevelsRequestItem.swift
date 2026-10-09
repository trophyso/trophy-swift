import Foundation

public struct PatchPointsLevelsRequestItem: Codable, Hashable, Sendable {
    /// The UUID of the level to update.
    public let id: String
    /// The updated level name.
    public let name: String?
    /// The updated threshold points value.
    public let points: Int?
    /// The updated level description.
    public let description: String?
    /// The updated badge, or `null` to clear it.
    public let badge: PatchPointsLevelsRequestItemBadge?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String? = nil,
        points: Int? = nil,
        description: String? = nil,
        badge: PatchPointsLevelsRequestItemBadge? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.points = points
        self.description = description
        self.badge = badge
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.points = try container.decodeIfPresent(Int.self, forKey: .points)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.badge = try container.decodeIfPresent(PatchPointsLevelsRequestItemBadge.self, forKey: .badge)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.badge, forKey: .badge)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case points
        case description
        case badge
    }
}