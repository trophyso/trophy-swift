import Foundation

/// Experimentation fields to update. Omitted fields stay as-is.
public struct UpdateAdminSettingsExperimentation: Codable, Hashable, Sendable {
    /// Percentage of new users assigned to the control group.
    public let controlRatio: Int?
    /// Number of days after a user's first event used to measure retention and early engagement.
    public let userActivationWindow: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        controlRatio: Int? = nil,
        userActivationWindow: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.controlRatio = controlRatio
        self.userActivationWindow = userActivationWindow
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.controlRatio = try container.decodeIfPresent(Int.self, forKey: .controlRatio)
        self.userActivationWindow = try container.decodeIfPresent(Int.self, forKey: .userActivationWindow)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.controlRatio, forKey: .controlRatio)
        try container.encodeIfPresent(self.userActivationWindow, forKey: .userActivationWindow)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case controlRatio
        case userActivationWindow
    }
}