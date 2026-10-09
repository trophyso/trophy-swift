import Foundation

public final class SystemsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List points systems.
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
    ///     _ = try await client.admin.points.systems.list(
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
    public func list(limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPointsSystemsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPointsSystemsResponse.self
        )
    }

    /// Create points systems. Optionally include sub-entities (levels, boosts, triggers) in each system payload to create them alongside the system.
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
    ///     _ = try await client.admin.points.systems.create(request: [
    ///         CreatePointsSystemRequestItem(
    ///             name: "XP",
    ///             key: "xp",
    ///             description: "Experience points",
    ///             levels: [
    ///                 CreatePointsLevelRequestItem(
    ///                     name: "Bronze",
    ///                     key: "bronze",
    ///                     points: 100
    ///                 ),
    ///                 CreatePointsLevelRequestItem(
    ///                     name: "Silver",
    ///                     key: "silver",
    ///                     points: 500
    ///                 )
    ///             ]
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreatePointsSystemsRequest, requestOptions: RequestOptions? = nil) async throws -> CreatePointsSystemsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/points",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePointsSystemsResponse.self
        )
    }

    /// Delete points systems by ID.
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
    ///     _ = try await client.admin.points.systems.delete(ids: [
    ///         "550e8400-e29b-41d4-a716-446655440000"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter ids: The IDs of the points systems to delete.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeletePointsSystemsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/points",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeletePointsSystemsResponse.self
        )
    }

    /// Update points systems by ID.
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
    ///     _ = try await client.admin.points.systems.update(request: [
    ///         UpdatePointsSystemRequestItem(
    ///             id: "550e8400-e29b-41d4-a716-446655440000",
    ///             name: "New Name"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: UpdatePointsSystemsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdatePointsSystemsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/points",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdatePointsSystemsResponse.self
        )
    }

    /// Get a points system by ID.
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
    ///     _ = try await client.admin.points.systems.get(id: "550e8400-e29b-41d4-a716-446655440000")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the points system.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> AdminPointsSystem {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(id)",
            requestOptions: requestOptions,
            responseType: AdminPointsSystem.self
        )
    }
}