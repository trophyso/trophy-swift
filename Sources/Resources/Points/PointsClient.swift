import Foundation

public final class PointsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Get a breakdown of the number of users with points in each range.
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
    ///     _ = try await client.points.summary(
    ///         key: "points-system-key",
    ///         userAttributes: "plan-type:premium,region:us-east"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter key: Key of the points system.
    /// - Parameter userAttributes: Optional colon-delimited user attribute filters in the format attribute:value,attribute:value. Only users matching ALL specified attributes will be included in the points breakdown.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func summary(key: String, userAttributes: String? = nil, requestOptions: RequestOptions? = nil) async throws -> PointsSummaryResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(key)/summary",
            queryParams: [
                "userAttributes": userAttributes.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: PointsSummaryResponse.self
        )
    }

    /// Get a points system with its triggers.
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
    ///     _ = try await client.points.system(key: "points-system-key")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter key: Key of the points system.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func system(key: String, requestOptions: RequestOptions? = nil) async throws -> PointsSystemResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(key)",
            requestOptions: requestOptions,
            responseType: PointsSystemResponse.self
        )
    }

    /// Get all global boosts for a points system. Finished boosts are excluded by default.
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
    ///     _ = try await client.points.boosts(
    ///         key: "points-system-key",
    ///         includeFinished: true
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter key: Key of the points system.
    /// - Parameter includeFinished: When set to 'true', boosts that have finished (past their end date) will be included in the response. By default, finished boosts are excluded.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func boosts(key: String, includeFinished: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> [PointsBoost] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(key)/boosts",
            queryParams: [
                "includeFinished": includeFinished.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: [PointsBoost].self
        )
    }

    /// Get all levels for a points system.
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
    ///     _ = try await client.points.levels(key: "points-system-key")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter key: Key of the points system.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func levels(key: String, requestOptions: RequestOptions? = nil) async throws -> [PointsLevel] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(key)/levels",
            requestOptions: requestOptions,
            responseType: [PointsLevel].self
        )
    }

    /// Get a breakdown of the number of users at each level in a points system.
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
    ///     _ = try await client.points.levelSummary(key: "points-system-key")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter key: Key of the points system.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func levelSummary(key: String, requestOptions: RequestOptions? = nil) async throws -> PointsLevelSummaryResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/points/\(key)/level-summary",
            requestOptions: requestOptions,
            responseType: PointsLevelSummaryResponse.self
        )
    }
}