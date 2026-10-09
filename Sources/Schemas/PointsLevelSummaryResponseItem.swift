import Foundation

public struct PointsLevelSummaryResponseItem: Codable, Hashable, Sendable {
    public let level: PointsLevel
    /// The number of users currently at this level
    public let users: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        level: PointsLevel,
        users: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.level = level
        self.users = users
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.level = try container.decode(PointsLevel.self, forKey: .level)
        self.users = try container.decode(Int.self, forKey: .users)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.users, forKey: .users)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case level
        case users
    }
}