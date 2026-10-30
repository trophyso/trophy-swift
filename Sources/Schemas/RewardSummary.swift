import Foundation

public struct RewardSummary: Codable, Hashable, Sendable {
    public let id: String
    public let key: String
    public let name: String
    public let description: String?
    public let type: RewardSummaryType
    public let points: Int?
    public let pointsSystemId: String?
    public let pointsSystemKey: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        key: String,
        name: String,
        description: String? = nil,
        type: RewardSummaryType,
        points: Int? = nil,
        pointsSystemId: String? = nil,
        pointsSystemKey: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.key = key
        self.name = name
        self.description = description
        self.type = type
        self.points = points
        self.pointsSystemId = pointsSystemId
        self.pointsSystemKey = pointsSystemKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.type = try container.decode(RewardSummaryType.self, forKey: .type)
        self.points = try container.decodeIfPresent(Int.self, forKey: .points)
        self.pointsSystemId = try container.decodeIfPresent(String.self, forKey: .pointsSystemId)
        self.pointsSystemKey = try container.decodeIfPresent(String.self, forKey: .pointsSystemKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.pointsSystemId, forKey: .pointsSystemId)
        try container.encodeIfPresent(self.pointsSystemKey, forKey: .pointsSystemKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case key
        case name
        case description
        case type
        case points
        case pointsSystemId
        case pointsSystemKey
    }
}