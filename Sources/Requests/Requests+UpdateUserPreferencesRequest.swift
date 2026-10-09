import Foundation

extension Requests {
    public struct UpdateUserPreferencesRequest: Codable, Hashable, Sendable {
        public let notifications: NotificationPreferences?
        public let streak: StreakPreferences?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            notifications: NotificationPreferences? = nil,
            streak: StreakPreferences? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.notifications = notifications
            self.streak = streak
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.notifications = try container.decodeIfPresent(NotificationPreferences.self, forKey: .notifications)
            self.streak = try container.decodeIfPresent(StreakPreferences.self, forKey: .streak)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.notifications, forKey: .notifications)
            try container.encodeIfPresent(self.streak, forKey: .streak)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case notifications
            case streak
        }
    }
}