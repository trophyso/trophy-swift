import Foundation

public final class AttributesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List attributes.
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
    ///     _ = try await client.admin.attributes.list(
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
    public func list(limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAttributesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/attributes",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAttributesResponse.self
        )
    }

    /// Create attributes.
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
    ///     _ = try await client.admin.attributes.create(request: [
    ///         CreateAttributeRequestItem(
    ///             name: "Plan",
    ///             key: "plan",
    ///             type: .user
    ///         ),
    ///         CreateAttributeRequestItem(
    ///             name: "Device",
    ///             key: "device",
    ///             type: .event
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateAttributesRequest, requestOptions: RequestOptions? = nil) async throws -> CreateAttributesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/attributes",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateAttributesResponse.self
        )
    }

    /// Delete attributes by ID.
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
    ///     _ = try await client.admin.attributes.delete(ids: [
    ///         "550e8400-e29b-41d4-a716-446655440000",
    ///         "550e8400-e29b-41d4-a716-446655440001"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter ids: Attribute IDs to delete. Repeat the query param or provide a comma-separated list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteAttributesResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/attributes",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteAttributesResponse.self
        )
    }

    /// Update attributes by ID.
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
    ///     _ = try await client.admin.attributes.update(request: [
    ///         UpdateAttributeRequestItem(
    ///             id: "550e8400-e29b-41d4-a716-446655440000",
    ///             name: "Subscription Plan"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: UpdateAttributesRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateAttributesResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/attributes",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateAttributesResponse.self
        )
    }

    /// Get an attribute by ID.
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
    ///     _ = try await client.admin.attributes.get(id: "550e8400-e29b-41d4-a716-446655440000")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The UUID of the attribute to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> AdminAttribute {
        return try await httpClient.performRequest(
            method: .get,
            path: "/attributes/\(id)",
            requestOptions: requestOptions,
            responseType: AdminAttribute.self
        )
    }
}