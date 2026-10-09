import Foundation

/// A user of your application.
public struct User: Codable, Hashable, Sendable {
    /// The ID of the user in your database. Must be a string.
    public let id: String
    /// The user's email address.
    public let email: String?
    /// The name of the user.
    public let name: String?
    /// The user's timezone.
    public let tz: String?
    /// The date the user signed up on your platform, as YYYY-MM-DD. Required for anniversary achievements. Null if not set, in which case the user is not eligible for anniversary achievements.
    public let signUpDate: String?
    /// The user's device tokens.
    public let deviceTokens: [String]?
    /// Whether the user is opted into receiving Trophy-powered emails.
    public let subscribeToEmails: Bool
    /// User attributes as key-value pairs. Keys must match existing user attributes set up in the Trophy dashboard.
    public let attributes: [String: String]
    /// Whether the user is in the control group, meaning they do not receive emails or other communications from Trophy.
    public let control: Bool
    /// The date and time the user was created, in ISO 8601 format.
    public let created: Date
    /// The date and time the user was last updated, in ISO 8601 format.
    public let updated: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        email: String? = nil,
        name: String? = nil,
        tz: String? = nil,
        signUpDate: String? = nil,
        deviceTokens: [String]? = nil,
        subscribeToEmails: Bool,
        attributes: [String: String],
        control: Bool,
        created: Date,
        updated: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.email = email
        self.name = name
        self.tz = tz
        self.signUpDate = signUpDate
        self.deviceTokens = deviceTokens
        self.subscribeToEmails = subscribeToEmails
        self.attributes = attributes
        self.control = control
        self.created = created
        self.updated = updated
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.tz = try container.decodeIfPresent(String.self, forKey: .tz)
        self.signUpDate = try container.decodeIfPresent(String.self, forKey: .signUpDate)
        self.deviceTokens = try container.decodeIfPresent([String].self, forKey: .deviceTokens)
        self.subscribeToEmails = try container.decode(Bool.self, forKey: .subscribeToEmails)
        self.attributes = try container.decode([String: String].self, forKey: .attributes)
        self.control = try container.decode(Bool.self, forKey: .control)
        self.created = try container.decode(Date.self, forKey: .created)
        self.updated = try container.decode(Date.self, forKey: .updated)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.tz, forKey: .tz)
        try container.encodeIfPresent(self.signUpDate, forKey: .signUpDate)
        try container.encodeIfPresent(self.deviceTokens, forKey: .deviceTokens)
        try container.encode(self.subscribeToEmails, forKey: .subscribeToEmails)
        try container.encode(self.attributes, forKey: .attributes)
        try container.encode(self.control, forKey: .control)
        try container.encode(self.created, forKey: .created)
        try container.encode(self.updated, forKey: .updated)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case email
        case name
        case tz
        case signUpDate
        case deviceTokens
        case subscribeToEmails
        case attributes
        case control
        case created
        case updated
    }
}