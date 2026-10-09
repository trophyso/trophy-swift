import Foundation

public final class AchievementsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Get all achievements and their completion stats.
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
    ///     _ = try await client.achievements.all(userAttributes: "plan-type:premium,region:us-east")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter userAttributes: Optional colon-delimited user attributes in the format attribute:value,attribute:value. Only achievements accessible to a user with the provided attributes will be returned.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func all(userAttributes: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [AchievementWithStatsResponse] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/achievements",
            queryParams: [
                "userAttributes": userAttributes.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [AchievementWithStatsResponse].self
        )
    }

    /// Mark an achievement as completed for a user.
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
    ///     _ = try await client.achievements.complete(
    ///         key: "finish-onboarding",
    ///         request: .init(user: UpsertedUser(
    ///             email: "user@example.com",
    ///             tz: "Europe/London",
    ///             id: "user-id"
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter key: Unique reference of the achievement as set when created.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func complete(key: String, request: Requests.AchievementsCompleteRequest, requestOptions: RequestOptions? = nil) async throws -> AchievementCompletionResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/achievements/\(key)/complete",
            body: request,
            requestOptions: requestOptions,
            responseType: AchievementCompletionResponse.self
        )
    }
}