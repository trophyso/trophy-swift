import Foundation

public final class RewardsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Redeem a reward for a user.
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
    ///     _ = try await client.rewards.redeem(
    ///         key: "key",
    ///         request: .init(user: UpsertedUser(
    ///             id: "user-id"
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter key: The key of the reward to redeem.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func redeem(key: String, request: Requests.RewardsRedeemRequest, requestOptions: RequestOptions? = nil) async throws -> RedeemRewardResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/rewards/\(key)/redeem",
            body: request,
            requestOptions: requestOptions,
            responseType: RedeemRewardResponse.self
        )
    }
}