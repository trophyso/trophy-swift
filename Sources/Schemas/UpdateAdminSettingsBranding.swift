import Foundation

/// Branding fields to update. Omitted fields stay as-is.
public struct UpdateAdminSettingsBranding: Codable, Hashable, Sendable {
    /// The name of the app or platform.
    public let appName: String?
    /// The URL of the app or platform.
    public let appUrl: String?
    /// Primary brand color as hex (`#RGB` or `#RRGGBB`), `rgb(r,g,b)`, or `rgba(r,g,b,a)`.
    public let brandColor: String?
    public let font: AdminFontFamily?
    /// Company logo, or `null` to clear it.
    public let logo: UpdateAdminSettingsBrandingLogo?
    /// App icon, or `null` to clear it.
    public let appIcon: UpdateAdminSettingsBrandingAppIcon?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appName: String? = nil,
        appUrl: String? = nil,
        brandColor: String? = nil,
        font: AdminFontFamily? = nil,
        logo: UpdateAdminSettingsBrandingLogo? = nil,
        appIcon: UpdateAdminSettingsBrandingAppIcon? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.appName = appName
        self.appUrl = appUrl
        self.brandColor = brandColor
        self.font = font
        self.logo = logo
        self.appIcon = appIcon
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appName = try container.decodeIfPresent(String.self, forKey: .appName)
        self.appUrl = try container.decodeIfPresent(String.self, forKey: .appUrl)
        self.brandColor = try container.decodeIfPresent(String.self, forKey: .brandColor)
        self.font = try container.decodeIfPresent(AdminFontFamily.self, forKey: .font)
        self.logo = try container.decodeIfPresent(UpdateAdminSettingsBrandingLogo.self, forKey: .logo)
        self.appIcon = try container.decodeIfPresent(UpdateAdminSettingsBrandingAppIcon.self, forKey: .appIcon)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.appName, forKey: .appName)
        try container.encodeIfPresent(self.appUrl, forKey: .appUrl)
        try container.encodeIfPresent(self.brandColor, forKey: .brandColor)
        try container.encodeIfPresent(self.font, forKey: .font)
        try container.encodeIfPresent(self.logo, forKey: .logo)
        try container.encodeIfPresent(self.appIcon, forKey: .appIcon)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case appName
        case appUrl
        case brandColor
        case font
        case logo
        case appIcon
    }
}