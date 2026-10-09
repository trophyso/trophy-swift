import Foundation

public final class AdminAchievementsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List achievements.
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
    ///     _ = try await client.admin.achievements.list(
    ///         limit: 1,
    ///         skip: 1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter limit: Number of records to return.
    /// - Parameter skip: Number of records to skip from the start of the list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAchievementsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/achievements",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAchievementsResponse.self
        )
    }

    /// Create achievements. Trigger-specific fields are required based on `trigger`.
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
    ///     _ = try await client.admin.achievements.create(request: [
    ///         CreateAchievementRequestItem(
    ///             name: "First Workout",
    ///             trigger: .metric,
    ///             metricId: "660f9500-f30c-42e5-b827-557766550001",
    ///             metricValue: 1
    ///         ),
    ///         CreateAchievementRequestItem(
    ///             name: "Custom Unlock",
    ///             trigger: .api,
    ///             key: "custom-unlock"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateAchievementsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateAchievementsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/achievements",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateAchievementsResponse.self
        )
    }

    /// Delete achievements by ID.
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
    ///     _ = try await client.admin.achievements.delete(ids: [
    ///         "550e8400-e29b-41d4-a716-446655440000",
    ///         "550e8400-e29b-41d4-a716-446655440001"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter ids: Achievement IDs to delete. Repeat the query param or provide a comma-separated list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteAchievementsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/achievements",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteAchievementsResponse.self
        )
    }

    /// Update achievements by ID. Maximum 100 achievements per request. Only provided fields are updated; omitted fields are preserved.
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
    ///     _ = try await client.admin.achievements.update(request: [
    ///         UpdateAchievementRequestItem(
    ///             id: "550e8400-e29b-41d4-a716-446655440000",
    ///             name: "First Workout Completed",
    ///             status: .active
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: UpdateAchievementsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateAchievementsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/achievements",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateAchievementsResponse.self
        )
    }

    /// Get an achievement by ID.
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
    ///     _ = try await client.admin.achievements.get(id: "550e8400-e29b-41d4-a716-446655440000")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The UUID of the achievement to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> AdminAchievement {
        return try await httpClient.performRequest(
            method: .get,
            path: "/achievements/\(id)",
            requestOptions: requestOptions,
            responseType: AdminAchievement.self
        )
    }
}