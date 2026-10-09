import Foundation

public final class AdminLeaderboardsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List leaderboards.
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
    ///     _ = try await client.admin.leaderboards.list(
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
    public func list(limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListLeaderboardsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/leaderboards",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListLeaderboardsResponse.self
        )
    }

    /// Create leaderboards.
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
    ///     _ = try await client.admin.leaderboards.create(request: [
    ///         CreateLeaderboardRequestItem(
    ///             name: "Revenue Champions",
    ///             key: "revenue-champions",
    ///             status: .inactive,
    ///             rankBy: .metric,
    ///             metricId: "550e8400-e29b-41d4-a716-446655440000",
    ///             maxParticipants: 100,
    ///             start: "2026-04-20",
    ///             breakdownAttributes: [
    ///                 "550e8400-e29b-41d4-a716-446655440010"
    ///             ],
    ///             runUnit: .month,
    ///             runInterval: 1
    ///         ),
    ///         CreateLeaderboardRequestItem(
    ///             name: "Streak Legends",
    ///             key: "streak-legends",
    ///             status: .scheduled,
    ///             rankBy: .streak,
    ///             start: "2026-04-27"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateLeaderboardsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateLeaderboardsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/leaderboards",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateLeaderboardsResponse.self
        )
    }

    /// Delete leaderboards by ID.
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
    ///     _ = try await client.admin.leaderboards.delete(ids: [
    ///         "ids"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter ids: Leaderboard IDs to delete. Repeat the query param or provide a comma-separated list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteLeaderboardsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/leaderboards",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteLeaderboardsResponse.self
        )
    }

    /// Update leaderboards by ID. Updating `status` behaves the same as activating, scheduling, deactivating, or finishing a leaderboard in the dashboard.
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
    ///     _ = try await client.admin.leaderboards.update(request: [
    ///         UpdateLeaderboardRequestItem(
    ///             id: "550e8400-e29b-41d4-a716-446655440100",
    ///             name: "Monthly Revenue Champions",
    ///             description: "Ranked by monthly revenue",
    ///             status: .active
    ///         ),
    ///         UpdateLeaderboardRequestItem(
    ///             id: "550e8400-e29b-41d4-a716-446655440101",
    ///             status: .finished
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: UpdateLeaderboardsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateLeaderboardsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/leaderboards",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateLeaderboardsResponse.self
        )
    }

    /// Get a leaderboard by ID.
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
    ///     _ = try await client.admin.leaderboards.get(id: "550e8400-e29b-41d4-a716-446655440100")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The UUID of the leaderboard to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> AdminLeaderboard {
        return try await httpClient.performRequest(
            method: .get,
            path: "/leaderboards/\(id)",
            requestOptions: requestOptions,
            responseType: AdminLeaderboard.self
        )
    }
}