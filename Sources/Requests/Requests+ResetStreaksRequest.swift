import Foundation

extension Requests {
    public struct ResetStreaksRequest: Codable, Hashable, Sendable {
        /// Array of users to reset streaks for. Maximum 100 users per request.
        public let users: [ResetStreaksRequestUsersItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            users: [ResetStreaksRequestUsersItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.users = users
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.users = try container.decode([ResetStreaksRequestUsersItem].self, forKey: .users)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.users, forKey: .users)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case users
        }
    }
}