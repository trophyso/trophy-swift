import Foundation

/// An object representing a past streak period.
public struct StreakResponseStreakHistoryItem: Codable, Hashable, Sendable {
    /// The date this streak period started.
    public let periodStart: String
    /// The date this streak period ended.
    public let periodEnd: String
    /// The length of the user's streak during this period.
    public let length: Int
    /// Whether the user used a streak freeze during this period. Only present if the organization has enabled streak freezes.
    public let usedFreeze: Bool?
    /// Whether the user's streak was paused during this period.
    public let usedPause: Bool
    /// The timestamp the streak was reset to zero using the admin API.
    public let resetAt: Date?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        periodStart: String,
        periodEnd: String,
        length: Int,
        usedFreeze: Bool? = nil,
        usedPause: Bool,
        resetAt: Date? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.length = length
        self.usedFreeze = usedFreeze
        self.usedPause = usedPause
        self.resetAt = resetAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.periodStart = try container.decode(String.self, forKey: .periodStart)
        self.periodEnd = try container.decode(String.self, forKey: .periodEnd)
        self.length = try container.decode(Int.self, forKey: .length)
        self.usedFreeze = try container.decodeIfPresent(Bool.self, forKey: .usedFreeze)
        self.usedPause = try container.decode(Bool.self, forKey: .usedPause)
        self.resetAt = try container.decodeIfPresent(Date.self, forKey: .resetAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.periodStart, forKey: .periodStart)
        try container.encode(self.periodEnd, forKey: .periodEnd)
        try container.encode(self.length, forKey: .length)
        try container.encodeIfPresent(self.usedFreeze, forKey: .usedFreeze)
        try container.encode(self.usedPause, forKey: .usedPause)
        try container.encodeIfPresent(self.resetAt, forKey: .resetAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case periodStart
        case periodEnd
        case length
        case usedFreeze
        case usedPause
        case resetAt
    }
}