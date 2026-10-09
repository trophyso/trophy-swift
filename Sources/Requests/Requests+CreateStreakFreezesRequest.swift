import Foundation

extension Requests {
    public struct CreateStreakFreezesRequest: Codable, Hashable, Sendable {
        /// Array of freezes to create. Maximum 100 freezes per request.
        public let freezes: [CreateStreakFreezesRequestFreezesItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            freezes: [CreateStreakFreezesRequestFreezesItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.freezes = freezes
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.freezes = try container.decode([CreateStreakFreezesRequestFreezesItem].self, forKey: .freezes)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.freezes, forKey: .freezes)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case freezes
        }
    }
}