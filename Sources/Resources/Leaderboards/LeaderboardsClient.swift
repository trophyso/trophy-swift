import Foundation

public final class LeaderboardsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Get all leaderboards for your organization. Finished leaderboards are excluded by default.
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
    ///     _ = try await client.leaderboards.all(includeFinished: true)
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter includeFinished: When set to 'true', leaderboards with status 'finished' will be included in the response. By default, finished leaderboards are excluded.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func all(includeFinished: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> [LeaderboardsAllResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/leaderboards",
            queryParams: [
                "includeFinished": includeFinished.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: [LeaderboardsAllResponseItem].self
        )
    }

    /// Get a specific leaderboard by its key.
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
    ///     _ = try await client.leaderboards.get(
    ///         key: "weekly-words",
    ///         offset: 1,
    ///         limit: 1,
    ///         run: "2025-01-15",
    ///         userId: "user-123",
    ///         userAttributes: "city:London"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter key: Unique key of the leaderboard as set when created.
    /// - Parameter offset: Number of rankings to skip for pagination.
    /// - Parameter limit: Maximum number of rankings to return. Cannot be greater than the size of the leaderboard.
    /// - Parameter run: Specific run date in YYYY-MM-DD format. If not provided, returns the current run.
    /// - Parameter userId: When provided, offset is relative to this user's position on the leaderboard. If the user is not found in the leaderboard, returns empty rankings array.
    /// - Parameter userAttributes: Attribute key and value to filter the rankings by, separated by a colon. For example, `city:London`. This parameter is required, and only valid for leaderboards with a breakdown attribute.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(key: String, offset: Int? = nil, limit: Int? = nil, run: String? = nil, userId: String? = nil, userAttributes: String? = nil, requestOptions: RequestOptions? = nil) async throws -> LeaderboardResponseWithRankings {
        return try await httpClient.performRequest(
            method: .get,
            path: "/leaderboards/\(key)",
            queryParams: [
                "offset": offset.map { .int($0) }, 
                "limit": limit.map { .int($0) }, 
                "run": run.map { .string($0) }, 
                "userId": userId.map { .string($0) }, 
                "userAttributes": userAttributes.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: LeaderboardResponseWithRankings.self
        )
    }
}