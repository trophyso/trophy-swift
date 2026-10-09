import Foundation

extension Requests {
    public struct AchievementsCompleteRequest: Codable, Hashable, Sendable {
        /// The user that completed the achievement.
        public let user: UpsertedUser
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            user: UpsertedUser,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.user = user
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.user = try container.decode(UpsertedUser.self, forKey: .user)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.user, forKey: .user)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case user
        }
    }
}