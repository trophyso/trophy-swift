import Foundation

extension Requests {
    public struct MetricsEventRequest: Codable, Hashable, Sendable {
        /// The user that triggered the event.
        public let user: UpsertedUser
        /// The value to add to the user's current total for the given metric.
        public let value: Double
        /// Event attributes as key-value pairs. Keys must match existing event attributes set up in the Trophy dashboard.
        public let attributes: [String: String]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            user: UpsertedUser,
            value: Double,
            attributes: [String: String]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.user = user
            self.value = value
            self.attributes = attributes
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.user = try container.decode(UpsertedUser.self, forKey: .user)
            self.value = try container.decode(Double.self, forKey: .value)
            self.attributes = try container.decodeIfPresent([String: String].self, forKey: .attributes)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.user, forKey: .user)
            try container.encode(self.value, forKey: .value)
            try container.encodeIfPresent(self.attributes, forKey: .attributes)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case user
            case value
            case attributes
        }
    }
}