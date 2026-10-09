import Foundation

/// The organization's branding, experimentation, and aggregation settings.
public struct AdminSettings: Codable, Hashable, Sendable {
    public let branding: AdminSettingsBranding
    public let experimentation: AdminSettingsExperimentation
    public let aggregationPeriod: AdminAggregationPeriod
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        branding: AdminSettingsBranding,
        experimentation: AdminSettingsExperimentation,
        aggregationPeriod: AdminAggregationPeriod,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.branding = branding
        self.experimentation = experimentation
        self.aggregationPeriod = aggregationPeriod
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.branding = try container.decode(AdminSettingsBranding.self, forKey: .branding)
        self.experimentation = try container.decode(AdminSettingsExperimentation.self, forKey: .experimentation)
        self.aggregationPeriod = try container.decode(AdminAggregationPeriod.self, forKey: .aggregationPeriod)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.branding, forKey: .branding)
        try container.encode(self.experimentation, forKey: .experimentation)
        try container.encode(self.aggregationPeriod, forKey: .aggregationPeriod)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case branding
        case experimentation
        case aggregationPeriod
    }
}