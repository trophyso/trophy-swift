import Foundation

public final class TenantsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List tenants in the current environment.
    ///
    /// ```swift
    /// import Foundation
    /// import Trophy
    ///
    /// private func main() async throws {
    ///     let client = TrophyApiClient(
    ///         apiKey: "<value>",
    ///         sdkVersion: "<X-SDK-VERSION>"
    ///     )
    ///
    ///     _ = try await client.admin.tenants.list(
    ///         limit: 1,
    ///         skip: 1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter limit: Number of records to return.
    /// - Parameter skip: Number of records to skip from the start of the list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListTenantsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/tenants",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListTenantsResponse.self
        )
    }

    /// Create tenants.
    ///
    /// ```swift
    /// import Foundation
    /// import Trophy
    ///
    /// private func main() async throws {
    ///     let client = TrophyApiClient(
    ///         apiKey: "<value>",
    ///         sdkVersion: "<X-SDK-VERSION>"
    ///     )
    ///
    ///     _ = try await client.admin.tenants.create(request: [
    ///         CreateTenantRequestItem(
    ///             customerId: "customer_12345",
    ///             name: "Acme Corp"
    ///         ),
    ///         CreateTenantRequestItem(
    ///             customerId: "customer_67890",
    ///             name: "Globex Inc"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateTenantsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateTenantsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/tenants",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateTenantsResponse.self
        )
    }

    /// Delete tenants by ID.
    ///
    /// ```swift
    /// import Foundation
    /// import Trophy
    ///
    /// private func main() async throws {
    ///     let client = TrophyApiClient(
    ///         apiKey: "<value>",
    ///         sdkVersion: "<X-SDK-VERSION>"
    ///     )
    ///
    ///     _ = try await client.admin.tenants.delete(ids: [
    ///         "550e8400-e29b-41d4-a716-446655440000",
    ///         "550e8400-e29b-41d4-a716-446655440001"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter ids: Tenant IDs to delete. Repeat the query param or provide a comma-separated list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteTenantsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/tenants",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteTenantsResponse.self
        )
    }

    /// Update tenants by ID.
    ///
    /// ```swift
    /// import Foundation
    /// import Trophy
    ///
    /// private func main() async throws {
    ///     let client = TrophyApiClient(
    ///         apiKey: "<value>",
    ///         sdkVersion: "<X-SDK-VERSION>"
    ///     )
    ///
    ///     _ = try await client.admin.tenants.update(request: [
    ///         UpdateTenantRequestItem(
    ///             id: "550e8400-e29b-41d4-a716-446655440000",
    ///             name: "Acme Corporation"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: UpdateTenantsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateTenantsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/tenants",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateTenantsResponse.self
        )
    }

    /// Get a tenant by ID.
    ///
    /// ```swift
    /// import Foundation
    /// import Trophy
    ///
    /// private func main() async throws {
    ///     let client = TrophyApiClient(
    ///         apiKey: "<value>",
    ///         sdkVersion: "<X-SDK-VERSION>"
    ///     )
    ///
    ///     _ = try await client.admin.tenants.get(id: "550e8400-e29b-41d4-a716-446655440000")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The UUID of the tenant to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> AdminTenant {
        return try await httpClient.performRequest(
            method: .get,
            path: "/tenants/\(id)",
            requestOptions: requestOptions,
            responseType: AdminTenant.self
        )
    }
}