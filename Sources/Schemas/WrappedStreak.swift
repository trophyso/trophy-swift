import Foundation

/// The user's longest streak during the wrapped period.
public struct WrappedStreak: Codable, Hashable, Sendable {
    /// The length of the streak.
    public let length: Int
    /// The frequency of the streak.
    public let frequency: StreakFrequency
    /// The start date of the streak period.
    public let periodStart: String?
    /// The end date of the streak period.
    public let periodEnd: String?
    /// The date the streak started.
    public let started: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        length: Int,
        frequency: StreakFrequency,
        periodStart: String? = nil,
        periodEnd: String? = nil,
        started: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.length = length
        self.frequency = frequency
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.started = started
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.length = try container.decode(Int.self, forKey: .length)
        self.frequency = try container.decode(StreakFrequency.self, forKey: .frequency)
        self.periodStart = try container.decodeIfPresent(String.self, forKey: .periodStart)
        self.periodEnd = try container.decodeIfPresent(String.self, forKey: .periodEnd)
        self.started = try container.decodeIfPresent(String.self, forKey: .started)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.length, forKey: .length)
        try container.encode(self.frequency, forKey: .frequency)
        try container.encodeIfPresent(self.periodStart, forKey: .periodStart)
        try container.encodeIfPresent(self.periodEnd, forKey: .periodEnd)
        try container.encodeIfPresent(self.started, forKey: .started)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case length
        case frequency
        case periodStart
        case periodEnd
        case started
    }
}