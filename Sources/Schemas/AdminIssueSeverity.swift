import Foundation

/// The severity level of the issue.
public enum AdminIssueSeverity: String, Codable, Hashable, CaseIterable, Sendable {
    case error
    case warning
}