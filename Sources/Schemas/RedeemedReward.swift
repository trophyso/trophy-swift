import Foundation

public struct RedeemedReward: Codable, Hashable, Sendable {
    /// The ID of the reward redemption.
    public let id: String
    /// When the reward was awarded.
    public let awardedAt: Date
    /// When the reward was redeemed.
    public let redeemedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        awardedAt: Date,
        redeemedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.awardedAt = awardedAt
        self.redeemedAt = redeemedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.awardedAt = try container.decode(Date.self, forKey: .awardedAt)
        self.redeemedAt = try container.decode(Date.self, forKey: .redeemedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.awardedAt, forKey: .awardedAt)
        try container.encode(self.redeemedAt, forKey: .redeemedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case awardedAt
        case redeemedAt
    }
}