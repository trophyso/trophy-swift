import Foundation

extension Requests {
    public struct UpdateUserPreferencesRequest: Codable, Hashable, Sendable {
        public let notifications: NotificationPreferences?
        public let streak: StreakPreferences?
        public let messaging: MessagingPreferences?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            notifications: NotificationPreferences? = nil,
            streak: StreakPreferences? = nil,
            messaging: MessagingPreferences? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.notifications = notifications
            self.streak = streak
            self.messaging = messaging
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.notifications = try container.decodeIfPresent(NotificationPreferences.self, forKey: .notifications)
            self.streak = try container.decodeIfPresent(StreakPreferences.self, forKey: .streak)
            self.messaging = try container.decodeIfPresent(MessagingPreferences.self, forKey: .messaging)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.notifications, forKey: .notifications)
            try container.encodeIfPresent(self.streak, forKey: .streak)
            try container.encodeIfPresent(self.messaging, forKey: .messaging)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case notifications
            case streak
            case messaging
        }
    }
}