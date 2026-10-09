import Foundation

public struct BulkStreakResponseItem: Codable, Hashable, Sendable {
    /// The ID of the user.
    public let userId: String
    /// The length of the user's streak.
    public let streakLength: Int
    /// The timestamp the streak was extended, as a string. Null if the streak is not active.
    public let extended: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        userId: String,
        streakLength: Int,
        extended: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.userId = userId
        self.streakLength = streakLength
        self.extended = extended
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.streakLength = try container.decode(Int.self, forKey: .streakLength)
        self.extended = try container.decodeIfPresent(String.self, forKey: .extended)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.streakLength, forKey: .streakLength)
        try container.encodeIfPresent(self.extended, forKey: .extended)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case userId
        case streakLength
        case extended
    }
}