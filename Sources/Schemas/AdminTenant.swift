import Foundation

/// A tenant in a multi-tenant environment.
public struct AdminTenant: Codable, Hashable, Sendable {
    /// The tenant UUID.
    public let id: String
    /// The external customer ID for this tenant.
    public let customerId: String
    /// Human-readable name for the tenant.
    public let name: String
    /// The lifecycle status of the tenant.
    public let status: AdminTenantStatus
    /// When the tenant was created.
    public let created: Date
    /// When the tenant was last updated.
    public let updated: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        customerId: String,
        name: String,
        status: AdminTenantStatus,
        created: Date,
        updated: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.customerId = customerId
        self.name = name
        self.status = status
        self.created = created
        self.updated = updated
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.customerId = try container.decode(String.self, forKey: .customerId)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(AdminTenantStatus.self, forKey: .status)
        self.created = try container.decode(Date.self, forKey: .created)
        self.updated = try container.decode(Date.self, forKey: .updated)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.customerId, forKey: .customerId)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.created, forKey: .created)
        try container.encode(self.updated, forKey: .updated)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case customerId
        case name
        case status
        case created
        case updated
    }
}