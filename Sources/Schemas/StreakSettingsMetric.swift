import Foundation

/// A metric that counts toward the organization streak.
public struct StreakSettingsMetric: Codable, Hashable, Sendable {
    /// The metric key.
    public let key: String
    /// Minimum metric change in a streak period to count toward the streak.
    public let threshold: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        key: String,
        threshold: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.key = key
        self.threshold = threshold
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decode(String.self, forKey: .key)
        self.threshold = try container.decode(Int.self, forKey: .threshold)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.threshold, forKey: .threshold)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case key
        case threshold
    }
}