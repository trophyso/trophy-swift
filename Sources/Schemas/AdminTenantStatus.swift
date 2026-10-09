import Foundation

/// The lifecycle status of the tenant.
public enum AdminTenantStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case archived
}