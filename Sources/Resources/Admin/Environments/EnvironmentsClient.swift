import Foundation

public final class EnvironmentsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List active environments.
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
    ///     _ = try await client.admin.environments.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(requestOptions: RequestOptions? = nil) async throws -> ListEnvironmentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/environments",
            requestOptions: requestOptions,
            responseType: ListEnvironmentsResponse.self
        )
    }
}