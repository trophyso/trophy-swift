import Foundation

public final class PausesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Create streak pauses for multiple users. A pause covers a specific date range and maintains the user's streak length during that range instead of ending the streak. Start dates in the past are rejected.
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
    ///     _ = try await client.admin.streaks.pauses.create(request: .init(pauses: [
    ///         CreateStreakPausesRequestPausesItem(
    ///             userId: "user-123",
    ///             start: "2026-08-20",
    ///             end: "2026-08-27"
    ///         ),
    ///         CreateStreakPausesRequestPausesItem(
    ///             userId: "user-456",
    ///             start: "2026-09-01",
    ///             end: "2026-09-07"
    ///         )
    ///     ]))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateStreakPausesRequest, requestOptions: RequestOptions? = nil) async throws -> CreateStreakPausesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/streaks/pauses",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateStreakPausesResponse.self
        )
    }

    /// Delete streak pauses by ID.
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
    ///     _ = try await client.admin.streaks.pauses.delete(ids: [
    ///         "550e8400-e29b-41d4-a716-446655440000",
    ///         "550e8400-e29b-41d4-a716-446655440001"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter ids: Streak pause IDs to delete. Repeat the query param or provide a comma-separated list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteStreakPausesResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/streaks/pauses",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteStreakPausesResponse.self
        )
    }
}