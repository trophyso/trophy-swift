import Foundation

/// Response returned when a batch of metric events is accepted.
public struct BatchEventsResponse: Codable, Hashable, Sendable {
    /// The number of events accepted into the processing queue.
    public let accepted: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accepted: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accepted = accepted
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accepted = try container.decode(Int.self, forKey: .accepted)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accepted, forKey: .accepted)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accepted
    }
}