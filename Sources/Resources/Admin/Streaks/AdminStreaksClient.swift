import Foundation

public final class AdminStreaksClient: Sendable {
    public let freezes: FreezesClient
    public let pauses: PausesClient
    public let settings: StreaksSettingsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.freezes = FreezesClient(config: config)
        self.pauses = PausesClient(config: config)
        self.settings = StreaksSettingsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Restore streaks for multiple users to the maximum previously achieved streak length found within the current restore window: the last 90 days for daily streaks, weekly periods starting with the week containing the start of the current calendar year for weekly streaks, and monthly periods starting at the beginning of the previous calendar year for monthly streaks.
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
    ///     _ = try await client.admin.streaks.restore(request: .init(users: [
    ///         RestoreStreaksRequestUsersItem(
    ///             id: "user-123"
    ///         ),
    ///         RestoreStreaksRequestUsersItem(
    ///             id: "user-456"
    ///         )
    ///     ]))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func restore(request: Requests.RestoreStreaksRequest, requestOptions: RequestOptions? = nil) async throws -> RestoreStreaksResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/streaks/restore",
            body: request,
            requestOptions: requestOptions,
            responseType: RestoreStreaksResponse.self
        )
    }

    /// Reset the current streak to zero for multiple users.
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
    ///     _ = try await client.admin.streaks.reset(request: .init(users: [
    ///         ResetStreaksRequestUsersItem(
    ///             id: "user-123"
    ///         ),
    ///         ResetStreaksRequestUsersItem(
    ///             id: "user-456"
    ///         )
    ///     ]))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func reset(request: Requests.ResetStreaksRequest, requestOptions: RequestOptions? = nil) async throws -> ResetStreaksResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/streaks/reset",
            body: request,
            requestOptions: requestOptions,
            responseType: ResetStreaksResponse.self
        )
    }
}