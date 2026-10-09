import Foundation

extension Requests {
    public struct UpdateAdminSettingsRequest: Codable, Hashable, Sendable {
        public let branding: UpdateAdminSettingsBranding?
        public let experimentation: UpdateAdminSettingsExperimentation?
        public let aggregationPeriod: AdminAggregationPeriod?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            branding: UpdateAdminSettingsBranding? = nil,
            experimentation: UpdateAdminSettingsExperimentation? = nil,
            aggregationPeriod: AdminAggregationPeriod? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.branding = branding
            self.experimentation = experimentation
            self.aggregationPeriod = aggregationPeriod
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.branding = try container.decodeIfPresent(UpdateAdminSettingsBranding.self, forKey: .branding)
            self.experimentation = try container.decodeIfPresent(UpdateAdminSettingsExperimentation.self, forKey: .experimentation)
            self.aggregationPeriod = try container.decodeIfPresent(AdminAggregationPeriod.self, forKey: .aggregationPeriod)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.branding, forKey: .branding)
            try container.encodeIfPresent(self.experimentation, forKey: .experimentation)
            try container.encodeIfPresent(self.aggregationPeriod, forKey: .aggregationPeriod)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case branding
            case experimentation
            case aggregationPeriod
        }
    }
}