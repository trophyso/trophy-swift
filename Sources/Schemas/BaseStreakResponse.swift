import Foundation

public struct BaseStreakResponse: Codable, Hashable, Sendable {
    /// The length of the user's current streak.
    public let length: Int
    /// The frequency of the streak.
    public let frequency: StreakFrequency
    /// The date the streak started.
    public let started: String?
    /// The start date of the current streak period.
    public let periodStart: String?
    /// The end date of the current streak period.
    public let periodEnd: String?
    /// The date the streak will expire if the user does not increment a metric.
    public let expires: String?
    /// The number of available streak freezes. Only present if the organization has enabled streak freezes.
    public let freezes: Int?
    /// The maximum number of streak freezes a user can have. Only present if the organization has enabled streak freezes.
    public let maxFreezes: Int?
    /// The interval at which the user will earn streak freezes, in days. Only present if the organization has enabled streak freeze auto-earn.
    public let freezeAutoEarnInterval: Int?
    /// The amount of streak freezes the user will earn per interval. Only present if the organization has enabled streak freeze auto-earn.
    public let freezeAutoEarnAmount: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        length: Int,
        frequency: StreakFrequency,
        started: String? = nil,
        periodStart: String? = nil,
        periodEnd: String? = nil,
        expires: String? = nil,
        freezes: Int? = nil,
        maxFreezes: Int? = nil,
        freezeAutoEarnInterval: Int? = nil,
        freezeAutoEarnAmount: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.length = length
        self.frequency = frequency
        self.started = started
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.expires = expires
        self.freezes = freezes
        self.maxFreezes = maxFreezes
        self.freezeAutoEarnInterval = freezeAutoEarnInterval
        self.freezeAutoEarnAmount = freezeAutoEarnAmount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.length = try container.decode(Int.self, forKey: .length)
        self.frequency = try container.decode(StreakFrequency.self, forKey: .frequency)
        self.started = try container.decodeIfPresent(String.self, forKey: .started)
        self.periodStart = try container.decodeIfPresent(String.self, forKey: .periodStart)
        self.periodEnd = try container.decodeIfPresent(String.self, forKey: .periodEnd)
        self.expires = try container.decodeIfPresent(String.self, forKey: .expires)
        self.freezes = try container.decodeIfPresent(Int.self, forKey: .freezes)
        self.maxFreezes = try container.decodeIfPresent(Int.self, forKey: .maxFreezes)
        self.freezeAutoEarnInterval = try container.decodeIfPresent(Int.self, forKey: .freezeAutoEarnInterval)
        self.freezeAutoEarnAmount = try container.decodeIfPresent(Int.self, forKey: .freezeAutoEarnAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.length, forKey: .length)
        try container.encode(self.frequency, forKey: .frequency)
        try container.encodeIfPresent(self.started, forKey: .started)
        try container.encodeIfPresent(self.periodStart, forKey: .periodStart)
        try container.encodeIfPresent(self.periodEnd, forKey: .periodEnd)
        try container.encodeIfPresent(self.expires, forKey: .expires)
        try container.encodeIfPresent(self.freezes, forKey: .freezes)
        try container.encodeIfPresent(self.maxFreezes, forKey: .maxFreezes)
        try container.encodeIfPresent(self.freezeAutoEarnInterval, forKey: .freezeAutoEarnInterval)
        try container.encodeIfPresent(self.freezeAutoEarnAmount, forKey: .freezeAutoEarnAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case length
        case frequency
        case started
        case periodStart
        case periodEnd
        case expires
        case freezes
        case maxFreezes
        case freezeAutoEarnInterval
        case freezeAutoEarnAmount
    }
}