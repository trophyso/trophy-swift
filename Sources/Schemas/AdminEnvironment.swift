import Foundation

/// An active environment in the organisation.
public struct AdminEnvironment: Codable, Hashable, Sendable {
    /// Human-readable name for the environment.
    public let name: String
    /// Machine-readable identifier for the environment.
    public let key: String
    /// Environment precedence. Lower numbers take priority. Production is always 1.
    public let priority: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        key: String,
        priority: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.key = key
        self.priority = priority
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.key = try container.decode(String.self, forKey: .key)
        self.priority = try container.decode(Int.self, forKey: .priority)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.priority, forKey: .priority)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case key
        case priority
    }
}