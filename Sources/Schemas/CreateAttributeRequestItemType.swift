import Foundation

/// The attribute type.
public enum CreateAttributeRequestItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case user
    case event
}