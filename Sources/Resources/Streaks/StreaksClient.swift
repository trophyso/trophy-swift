import Foundation

public final class StreaksClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Get the streak lengths of a list of users, ranked by streak length from longest to shortest.
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
    ///     _ = try await client.streaks.list(userIds: [
    ///         "userIds"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter userIds: A list of up to 100 user IDs.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(userIds: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> BulkStreakResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/streaks",
            queryParams: [
                "userIds": userIds.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: BulkStreakResponse.self
        )
    }
}