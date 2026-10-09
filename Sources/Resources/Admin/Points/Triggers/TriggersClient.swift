import Foundation

public final class TriggersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List points triggers for a system.
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
    ///     _ = try await client.admin.points.triggers.list(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         limit: 1,
    ///         skip: 1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter systemId: The UUID of the points system.
    /// - Parameter limit: Maximum number of results to return (1-100, default 10).
    /// - Parameter skip: Number of results to skip for pagination (default 0).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(systemId: String, limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPointsTriggersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(systemId)/triggers",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPointsTriggersResponse.self
        )
    }

    /// Create points triggers in bulk.
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
    ///     _ = try await client.admin.points.triggers.create(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         request: [
    ///             CreatePointsTriggerRequestItem(
    ///                 type: .metric,
    ///                 points: 10
    ///             )
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter systemId: The UUID of the points system.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(systemId: String, request: CreatePointsTriggersRequest, requestOptions: RequestOptions? = nil) async throws -> CreatePointsTriggersResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/points/\(systemId)/triggers",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePointsTriggersResponse.self
        )
    }

    /// Delete points triggers by ID. Maximum 100 trigger IDs per request.
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
    ///     _ = try await client.admin.points.triggers.delete(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         ids: [
    ///             "550e8400-e29b-41d4-a716-446655440000"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter systemId: The UUID of the points system.
    /// - Parameter ids: Trigger IDs to delete. Can be repeated or comma-separated.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(systemId: String, ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeletePointsTriggersResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/points/\(systemId)/triggers",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeletePointsTriggersResponse.self
        )
    }

    /// Update points triggers in bulk. Maximum 100 triggers per request. Only provided fields are updated; omitted fields are preserved.
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
    ///     _ = try await client.admin.points.triggers.update(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         request: [
    ///             PatchPointsTriggersRequestItem(
    ///                 id: "id"
    ///             )
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter systemId: The UUID of the points system.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(systemId: String, request: PatchPointsTriggersRequest, requestOptions: RequestOptions? = nil) async throws -> PatchPointsTriggersResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/points/\(systemId)/triggers",
            body: request,
            requestOptions: requestOptions,
            responseType: PatchPointsTriggersResponse.self
        )
    }

    /// Get a single points trigger by ID.
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
    ///     _ = try await client.admin.points.triggers.get(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         id: "660f9500-f30c-42e5-b827-557766550001"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter systemId: The UUID of the points system.
    /// - Parameter id: The UUID of the points trigger.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(systemId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> AdminPointsTrigger {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(systemId)/triggers/\(id)",
            requestOptions: requestOptions,
            responseType: AdminPointsTrigger.self
        )
    }
}