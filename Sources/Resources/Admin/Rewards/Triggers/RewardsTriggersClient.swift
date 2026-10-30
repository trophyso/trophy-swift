import Foundation

public final class RewardsTriggersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List triggers for a reward. Active triggers are listed first.
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
    ///     _ = try await client.admin.rewards.triggers.list(
    ///         rewardId: "550e8400-e29b-41d4-a716-446655440000",
    ///         limit: 1,
    ///         skip: 1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter rewardId: The UUID of the reward.
    /// - Parameter limit: Maximum number of results to return (1-100, default 10).
    /// - Parameter skip: Number of results to skip for pagination (default 0).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(rewardId: String, limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListRewardTriggersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/rewards/\(rewardId)/triggers",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListRewardTriggersResponse.self
        )
    }

    /// Create reward triggers in bulk. Maximum 100 triggers per request.
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
    ///     _ = try await client.admin.rewards.triggers.create(
    ///         rewardId: "550e8400-e29b-41d4-a716-446655440000",
    ///         request: [
    ///             CreateRewardTriggerRequestItem(
    ///                 type: .metric,
    ///                 metricId: "990c2800-c63f-45b8-e15a-88aa99880004",
    ///                 metricThreshold: 10
    ///             )
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter rewardId: The UUID of the reward.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(rewardId: String, request: CreateRewardTriggersRequest, requestOptions: RequestOptions? = nil) async throws -> CreateRewardTriggersResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/rewards/\(rewardId)/triggers",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateRewardTriggersResponse.self
        )
    }

    /// Delete reward triggers by ID. Maximum 100 trigger IDs per request. A reward with no triggers is not awarded until a trigger is added.
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
    ///     _ = try await client.admin.rewards.triggers.delete(
    ///         rewardId: "550e8400-e29b-41d4-a716-446655440000",
    ///         ids: [
    ///             "880b1700-b52e-44a7-d049-779988770003"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter rewardId: The UUID of the reward.
    /// - Parameter ids: Trigger IDs to delete. Can be repeated or comma-separated.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(rewardId: String, ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteRewardTriggersResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/rewards/\(rewardId)/triggers",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteRewardTriggersResponse.self
        )
    }

    /// Update reward triggers in bulk. Maximum 100 triggers per request. Only provided fields are updated; omitted fields are preserved. A trigger keeps its ID when its criteria change.
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
    ///     _ = try await client.admin.rewards.triggers.update(
    ///         rewardId: "550e8400-e29b-41d4-a716-446655440000",
    ///         request: [
    ///             UpdateRewardTriggersRequestItem(
    ///                 id: "880b1700-b52e-44a7-d049-779988770003",
    ///                 status: .active
    ///             )
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter rewardId: The UUID of the reward.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(rewardId: String, request: UpdateRewardTriggersRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateRewardTriggersResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/rewards/\(rewardId)/triggers",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateRewardTriggersResponse.self
        )
    }

    /// Get a single reward trigger by ID.
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
    ///     _ = try await client.admin.rewards.triggers.get(
    ///         rewardId: "550e8400-e29b-41d4-a716-446655440000",
    ///         id: "880b1700-b52e-44a7-d049-779988770003"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter rewardId: The UUID of the reward.
    /// - Parameter id: The UUID of the reward trigger.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(rewardId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> AdminRewardTrigger {
        return try await httpClient.performRequest(
            method: .get,
            path: "/rewards/\(rewardId)/triggers/\(id)",
            requestOptions: requestOptions,
            responseType: AdminRewardTrigger.self
        )
    }
}