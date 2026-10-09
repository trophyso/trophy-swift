import Foundation

extension Requests {
    public struct CreateStreakPausesRequest: Codable, Hashable, Sendable {
        /// Array of pauses to create. Maximum 100 pauses per request.
        public let pauses: [CreateStreakPausesRequestPausesItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            pauses: [CreateStreakPausesRequestPausesItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.pauses = pauses
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.pauses = try container.decode([CreateStreakPausesRequestPausesItem].self, forKey: .pauses)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.pauses, forKey: .pauses)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case pauses
        }
    }
}