import Foundation

public final class FreezesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Create streak freezes for multiple users.
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
    ///     _ = try await client.admin.streaks.freezes.create(request: .init(freezes: [
    ///         CreateStreakFreezesRequestFreezesItem(
    ///             userId: "user-123"
    ///         ),
    ///         CreateStreakFreezesRequestFreezesItem(
    ///             userId: "user-456"
    ///         ),
    ///         CreateStreakFreezesRequestFreezesItem(
    ///             userId: "user-123"
    ///         )
    ///     ]))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateStreakFreezesRequest, requestOptions: RequestOptions? = nil) async throws -> CreateStreakFreezesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/streaks/freezes",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateStreakFreezesResponse.self
        )
    }
}