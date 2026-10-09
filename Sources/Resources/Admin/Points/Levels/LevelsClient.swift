import Foundation

public final class LevelsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List points levels for a system.
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
    ///     _ = try await client.admin.points.levels.list(
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
    /// - Parameter limit: Number of records to return.
    /// - Parameter skip: Number of records to skip from the start of the list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(systemId: String, limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPointsLevelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(systemId)/levels",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPointsLevelsResponse.self
        )
    }

    /// Create points levels.
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
    ///     _ = try await client.admin.points.levels.create(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         request: [
    ///             CreatePointsLevelRequestItem(
    ///                 name: "Bronze",
    ///                 key: "bronze",
    ///                 points: 100
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
    public func create(systemId: String, request: CreatePointsLevelsRequest, requestOptions: RequestOptions? = nil) async throws -> CreatePointsLevelsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/points/\(systemId)/levels",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePointsLevelsResponse.self
        )
    }

    /// Delete multiple points levels by ID.
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
    ///     _ = try await client.admin.points.levels.delete(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         ids: [
    ///             "ids"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter systemId: The UUID of the points system.
    /// - Parameter ids: Comma-separated list of level UUIDs to delete.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(systemId: String, ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeletePointsLevelsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/points/\(systemId)/levels",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeletePointsLevelsResponse.self
        )
    }

    /// Update multiple points levels. Each item must include an ID. `key` cannot be changed.
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
    ///     _ = try await client.admin.points.levels.update(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         request: [
    ///             PatchPointsLevelsRequestItem(
    ///                 id: "550e8400-e29b-41d4-a716-446655440000"
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
    public func update(systemId: String, request: PatchPointsLevelsRequest, requestOptions: RequestOptions? = nil) async throws -> PatchPointsLevelsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/points/\(systemId)/levels",
            body: request,
            requestOptions: requestOptions,
            responseType: PatchPointsLevelsResponse.self
        )
    }

    /// Get a single points level by ID.
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
    ///     _ = try await client.admin.points.levels.get(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         id: "660f9500-f30c-42e5-b827-557766550001"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter systemId: The UUID of the points system.
    /// - Parameter id: The UUID of the points level.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(systemId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> AdminPointsLevel {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(systemId)/levels/\(id)",
            requestOptions: requestOptions,
            responseType: AdminPointsLevel.self
        )
    }
}