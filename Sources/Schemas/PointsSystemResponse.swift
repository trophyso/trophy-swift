import Foundation

public struct PointsSystemResponse: Codable, Hashable, Sendable {
    /// The unique ID of the points system.
    public let id: String
    /// The name of the points system.
    public let name: String
    /// The description of the points system.
    public let description: String?
    /// The URL of the badge image for the points system, if one has been uploaded.
    public let badgeUrl: String?
    /// The maximum number of points a user can be awarded in this points system
    public let maxPoints: Double?
    /// Array of active triggers for this points system.
    public let triggers: [PointsTrigger]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        description: String? = nil,
        badgeUrl: String? = nil,
        maxPoints: Double? = nil,
        triggers: [PointsTrigger],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.badgeUrl = badgeUrl
        self.maxPoints = maxPoints
        self.triggers = triggers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.badgeUrl = try container.decodeIfPresent(String.self, forKey: .badgeUrl)
        self.maxPoints = try container.decodeIfPresent(Double.self, forKey: .maxPoints)
        self.triggers = try container.decode([PointsTrigger].self, forKey: .triggers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.badgeUrl, forKey: .badgeUrl)
        try container.encodeIfPresent(self.maxPoints, forKey: .maxPoints)
        try container.encode(self.triggers, forKey: .triggers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case description
        case badgeUrl
        case maxPoints
        case triggers
    }
}