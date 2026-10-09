import Foundation

public struct PointsRange: Codable, Hashable, Sendable {
    /// The start of the points range. Inclusive.
    public let from: Int
    /// The end of the points range. Inclusive.
    public let to: Int
    /// The number of users in this points range.
    public let users: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        from: Int,
        to: Int,
        users: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.from = from
        self.to = to
        self.users = users
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.from = try container.decode(Int.self, forKey: .from)
        self.to = try container.decode(Int.self, forKey: .to)
        self.users = try container.decode(Int.self, forKey: .users)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.from, forKey: .from)
        try container.encode(self.to, forKey: .to)
        try container.encode(self.users, forKey: .users)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case from
        case to
        case users
    }
}