import Foundation

/// An object with editable user fields.
public struct UpsertedUser: Codable, Hashable, Sendable {
    /// The user's email address. Required if subscribeToEmails is true.
    public let email: String?
    /// The name to refer to the user by in emails.
    public let name: String?
    /// The user's timezone (used for email scheduling).
    public let tz: String?
    /// The date the user signed up on your platform, as YYYY-MM-DD. ISO 8601 date-times are accepted and stored as their UTC calendar day. Must not be after today in the user's timezone. Required for anniversary achievements. Users without a signUpDate are not eligible.
    public let signUpDate: String?
    /// The user's device tokens, used for push notifications.
    public let deviceTokens: [String]?
    /// Whether the user should receive Trophy-powered emails. If false, Trophy will not store the user's email address.
    public let subscribeToEmails: Bool?
    /// User attributes as key-value pairs. Keys must match existing user attributes set up in the Trophy dashboard.
    public let attributes: [String: String]?
    /// The ID of the user in your database. Must be a string.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: String? = nil,
        name: String? = nil,
        tz: String? = nil,
        signUpDate: String? = nil,
        deviceTokens: [String]? = nil,
        subscribeToEmails: Bool? = nil,
        attributes: [String: String]? = nil,
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.name = name
        self.tz = tz
        self.signUpDate = signUpDate
        self.deviceTokens = deviceTokens
        self.subscribeToEmails = subscribeToEmails
        self.attributes = attributes
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.tz = try container.decodeIfPresent(String.self, forKey: .tz)
        self.signUpDate = try container.decodeIfPresent(String.self, forKey: .signUpDate)
        self.deviceTokens = try container.decodeIfPresent([String].self, forKey: .deviceTokens)
        self.subscribeToEmails = try container.decodeIfPresent(Bool.self, forKey: .subscribeToEmails)
        self.attributes = try container.decodeIfPresent([String: String].self, forKey: .attributes)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.tz, forKey: .tz)
        try container.encodeIfPresent(self.signUpDate, forKey: .signUpDate)
        try container.encodeIfPresent(self.deviceTokens, forKey: .deviceTokens)
        try container.encodeIfPresent(self.subscribeToEmails, forKey: .subscribeToEmails)
        try container.encodeIfPresent(self.attributes, forKey: .attributes)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case name
        case tz
        case signUpDate
        case deviceTokens
        case subscribeToEmails
        case attributes
        case id
    }
}