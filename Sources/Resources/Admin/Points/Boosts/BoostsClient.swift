import Foundation

public final class BoostsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List points boosts for a system.
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
    ///     _ = try await client.admin.points.boosts.list(
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
    public func list(systemId: String, limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPointsBoostsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(systemId)/boosts",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPointsBoostsResponse.self
        )
    }

    /// Create points boosts.
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
    ///     _ = try await client.admin.points.boosts.create(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         request: [
    ///             CreatePointsBoostRequestItem(
    ///                 userId: "user-123",
    ///                 name: "Double XP Weekend",
    ///                 start: "2024-01-01",
    ///                 end: "2024-01-03",
    ///                 multiplier: 2
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
    public func create(systemId: String, request: CreatePointsBoostsRequest, requestOptions: RequestOptions? = nil) async throws -> CreatePointsBoostsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/points/\(systemId)/boosts",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePointsBoostsResponse.self
        )
    }

    /// Delete multiple points boosts by ID.
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
    ///     _ = try await client.admin.points.boosts.delete(
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
    /// - Parameter ids: A list of up to 100 boost IDs.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(systemId: String, ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeletePointsBoostsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/points/\(systemId)/boosts",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeletePointsBoostsResponse.self
        )
    }

    /// Update multiple points boosts.
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
    ///     _ = try await client.admin.points.boosts.update(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         request: [
    ///             PatchPointsBoostsRequestItem(
    ///                 id: "550e8400-e29b-41d4-a716-446655440000",
    ///                 name: "Updated Boost Name",
    ///                 multiplier: 3
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
    public func update(systemId: String, request: PatchPointsBoostsRequest, requestOptions: RequestOptions? = nil) async throws -> PatchPointsBoostsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/points/\(systemId)/boosts",
            body: request,
            requestOptions: requestOptions,
            responseType: PatchPointsBoostsResponse.self
        )
    }

    /// Get a single points boost by ID.
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
    ///     _ = try await client.admin.points.boosts.get(
    ///         systemId: "550e8400-e29b-41d4-a716-446655440000",
    ///         id: "660f9500-f30c-42e5-b827-557766550001"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter systemId: The UUID of the points system.
    /// - Parameter id: The UUID of the points boost.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(systemId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> AdminPointsBoost {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(systemId)/boosts/\(id)",
            requestOptions: requestOptions,
            responseType: AdminPointsBoost.self
        )
    }
}