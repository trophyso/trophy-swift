import Foundation

/// The attribute type.
public enum AdminAttributeType: String, Codable, Hashable, CaseIterable, Sendable {
    case user
    case event
}