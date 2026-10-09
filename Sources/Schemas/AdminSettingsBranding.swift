import Foundation

/// Organization branding settings.
public struct AdminSettingsBranding: Codable, Hashable, Sendable {
    /// The name of the app or platform.
    public let appName: String
    /// The URL of the app or platform.
    public let appUrl: String
    /// Primary brand color as hex (`#RGB` or `#RRGGBB`), `rgb(r,g,b)`, or `rgba(r,g,b,a)`.
    public let brandColor: String
    public let font: AdminFontFamily
    /// Company logo used in emails, or `null` if none is set.
    public let logo: AdminSettingsBrandingLogo?
    /// App icon used in push notification previews, or `null` if none is set.
    public let appIcon: AdminSettingsBrandingAppIcon?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appName: String,
        appUrl: String,
        brandColor: String,
        font: AdminFontFamily,
        logo: AdminSettingsBrandingLogo? = nil,
        appIcon: AdminSettingsBrandingAppIcon? = nil,
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
        self.appName = try container.decode(String.self, forKey: .appName)
        self.appUrl = try container.decode(String.self, forKey: .appUrl)
        self.brandColor = try container.decode(String.self, forKey: .brandColor)
        self.font = try container.decode(AdminFontFamily.self, forKey: .font)
        self.logo = try container.decodeIfPresent(AdminSettingsBrandingLogo.self, forKey: .logo)
        self.appIcon = try container.decodeIfPresent(AdminSettingsBrandingAppIcon.self, forKey: .appIcon)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.appName, forKey: .appName)
        try container.encode(self.appUrl, forKey: .appUrl)
        try container.encode(self.brandColor, forKey: .brandColor)
        try container.encode(self.font, forKey: .font)
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