import Foundation

/// Organization streak freeze configuration. `null` on the parent object means freezes are disabled.
public struct StreakSettingsFreezes: Codable, Hashable, Sendable {
    /// Number of freezes new users start with.
    public let startCount: Int
    /// Maximum number of freezes a user can have.
    public let maxCount: Int
    /// Days between auto-earned freezes. `null` when auto-earn is off.
    public let autoEarnInterval: Int?
    /// Freezes earned per interval. `null` when auto-earn is off.
    public let autoEarnAmount: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        startCount: Int,
        maxCount: Int,
        autoEarnInterval: Int? = nil,
        autoEarnAmount: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.startCount = startCount
        self.maxCount = maxCount
        self.autoEarnInterval = autoEarnInterval
        self.autoEarnAmount = autoEarnAmount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.startCount = try container.decode(Int.self, forKey: .startCount)
        self.maxCount = try container.decode(Int.self, forKey: .maxCount)
        self.autoEarnInterval = try container.decodeIfPresent(Int.self, forKey: .autoEarnInterval)
        self.autoEarnAmount = try container.decodeIfPresent(Int.self, forKey: .autoEarnAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.startCount, forKey: .startCount)
        try container.encode(self.maxCount, forKey: .maxCount)
        try container.encodeIfPresent(self.autoEarnInterval, forKey: .autoEarnInterval)
        try container.encodeIfPresent(self.autoEarnAmount, forKey: .autoEarnAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case startCount
        case maxCount
        case autoEarnInterval
        case autoEarnAmount
    }
}