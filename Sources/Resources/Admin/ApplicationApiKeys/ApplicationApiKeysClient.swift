import Foundation

public final class ApplicationApiKeysClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Create application API keys scoped to specific users. Each key can only perform operations on behalf of the user it was created for.
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
    ///     _ = try await client.admin.applicationApiKeys.create(request: [
    ///         CreateApplicationKeyRequestItem(
    ///             userId: "user_123"
    ///         ),
    ///         CreateApplicationKeyRequestItem(
    ///             userId: "user_456"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateApplicationKeysRequest, requestOptions: RequestOptions? = nil) async throws -> CreateApplicationKeysResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/application-api-keys",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateApplicationKeysResponse.self
        )
    }

    /// Delete application API keys by ID.
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
    ///     _ = try await client.admin.applicationApiKeys.delete(ids: [
    ///         "550e8400-e29b-41d4-a716-446655440000"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter ids: Application API key IDs (UUIDs returned at creation time). Repeat the query param or provide a comma-separated list. Maximum 100 IDs per request.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteApplicationKeysResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/application-api-keys",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteApplicationKeysResponse.self
        )
    }
}