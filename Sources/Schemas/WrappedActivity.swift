import Foundation

/// The user's activity summary for the wrapped year.
public struct WrappedActivity: Codable, Hashable, Sendable {
    /// The number of days the user was active during the year.
    public let daysActive: Int
    /// The number of weeks the user was active during the year.
    public let weeksActive: Int
    /// The number of months the user was active during the year.
    public let monthsActive: Int
    /// Data about the user's most active day.
    public let mostActiveDay: WrappedMostActiveDay
    /// Data about the user's most active week.
    public let mostActiveWeek: WrappedMostActiveWeek
    /// Data about the user's most active month.
    public let mostActiveMonth: WrappedMostActiveMonth
    /// Data about the user's activity for the entire year.
    public let entireYear: WrappedEntireYear
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        daysActive: Int,
        weeksActive: Int,
        monthsActive: Int,
        mostActiveDay: WrappedMostActiveDay,
        mostActiveWeek: WrappedMostActiveWeek,
        mostActiveMonth: WrappedMostActiveMonth,
        entireYear: WrappedEntireYear,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.daysActive = daysActive
        self.weeksActive = weeksActive
        self.monthsActive = monthsActive
        self.mostActiveDay = mostActiveDay
        self.mostActiveWeek = mostActiveWeek
        self.mostActiveMonth = mostActiveMonth
        self.entireYear = entireYear
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.daysActive = try container.decode(Int.self, forKey: .daysActive)
        self.weeksActive = try container.decode(Int.self, forKey: .weeksActive)
        self.monthsActive = try container.decode(Int.self, forKey: .monthsActive)
        self.mostActiveDay = try container.decode(WrappedMostActiveDay.self, forKey: .mostActiveDay)
        self.mostActiveWeek = try container.decode(WrappedMostActiveWeek.self, forKey: .mostActiveWeek)
        self.mostActiveMonth = try container.decode(WrappedMostActiveMonth.self, forKey: .mostActiveMonth)
        self.entireYear = try container.decode(WrappedEntireYear.self, forKey: .entireYear)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.daysActive, forKey: .daysActive)
        try container.encode(self.weeksActive, forKey: .weeksActive)
        try container.encode(self.monthsActive, forKey: .monthsActive)
        try container.encode(self.mostActiveDay, forKey: .mostActiveDay)
        try container.encode(self.mostActiveWeek, forKey: .mostActiveWeek)
        try container.encode(self.mostActiveMonth, forKey: .mostActiveMonth)
        try container.encode(self.entireYear, forKey: .entireYear)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case daysActive
        case weeksActive
        case monthsActive
        case mostActiveDay
        case mostActiveWeek
        case mostActiveMonth
        case entireYear
    }
}