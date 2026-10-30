import Foundation

public final class AdminRewardsClient: Sendable {
    public let triggers: RewardsTriggersClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.triggers = RewardsTriggersClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// List rewards.
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
    ///     _ = try await client.admin.rewards.list(
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
    public func list(limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListRewardsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/rewards",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListRewardsResponse.self
        )
    }

    /// Create rewards. Optionally include triggers in each reward payload to create them alongside the reward. A reward with any invalid trigger is not created.
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
    ///     _ = try await client.admin.rewards.create(request: [
    ///         CreateRewardRequestItem(
    ///             name: "Welcome bonus",
    ///             key: "welcome-bonus",
    ///             description: "Points for finishing onboarding",
    ///             type: .points,
    ///             pointsSystemId: "660f9500-f30c-42e5-b827-557766550001",
    ///             points: 100,
    ///             maxRedemptions: 1,
    ///             triggers: [
    ///                 CreateRewardTriggerRequestItem(
    ///                     type: .achievement,
    ///                     status: .active,
    ///                     achievementId: "770a0600-a41d-43f6-c938-668877660002"
    ///                 )
    ///             ]
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateRewardsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateRewardsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/rewards",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateRewardsResponse.self
        )
    }

    /// Delete rewards by ID. Maximum 100 reward IDs per request. A deleted reward's triggers are deleted too.
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
    ///     _ = try await client.admin.rewards.delete(ids: [
    ///         "550e8400-e29b-41d4-a716-446655440000"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter ids: Reward IDs to delete. Can be repeated or comma-separated.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteRewardsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/rewards",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteRewardsResponse.self
        )
    }

    /// Update rewards by ID. Maximum 100 rewards per request. Only provided fields are updated; omitted fields are preserved. Use the reward triggers endpoints to change a reward's triggers.
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
    ///     _ = try await client.admin.rewards.update(request: [
    ///         UpdateRewardRequestItem(
    ///             id: "550e8400-e29b-41d4-a716-446655440000",
    ///             status: .active,
    ///             points: 150
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: UpdateRewardsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateRewardsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/rewards",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateRewardsResponse.self
        )
    }

    /// Get a reward by ID.
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
    ///     _ = try await client.admin.rewards.get(id: "550e8400-e29b-41d4-a716-446655440000")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the reward.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> AdminReward {
        return try await httpClient.performRequest(
            method: .get,
            path: "/rewards/\(id)",
            requestOptions: requestOptions,
            responseType: AdminReward.self
        )
    }
}