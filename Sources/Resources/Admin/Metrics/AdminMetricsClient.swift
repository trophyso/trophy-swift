import Foundation

public final class AdminMetricsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List metrics.
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
    ///     _ = try await client.admin.metrics.list(
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
    public func list(limit: Int? = nil, skip: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMetricsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/metrics",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "skip": skip.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListMetricsResponse.self
        )
    }

    /// Create metrics.
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
    ///     _ = try await client.admin.metrics.create(request: [
    ///         CreateMetricRequestItem(
    ///             name: "Invites Sent",
    ///             key: "invites-sent"
    ///         ),
    ///         CreateMetricRequestItem(
    ///             name: "Revenue",
    ///             key: "revenue",
    ///             unitType: .currency,
    ///             units: "USD"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateMetricsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateMetricsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/metrics",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateMetricsResponse.self
        )
    }

    /// Delete metrics by ID.
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
    ///     _ = try await client.admin.metrics.delete(ids: [
    ///         "550e8400-e29b-41d4-a716-446655440000",
    ///         "550e8400-e29b-41d4-a716-446655440001"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter ids: Metric IDs to delete. Repeat the query param or provide a comma-separated list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(ids: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteMetricsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/metrics",
            queryParams: [
                "ids": ids.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteMetricsResponse.self
        )
    }

    /// Update metrics by ID.
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
    ///     _ = try await client.admin.metrics.update(request: [
    ///         UpdateMetricRequestItem(
    ///             id: "550e8400-e29b-41d4-a716-446655440000",
    ///             name: "Invites Completed",
    ///             units: "invites"
    ///         ),
    ///         UpdateMetricRequestItem(
    ///             id: "550e8400-e29b-41d4-a716-446655440001",
    ///             unitType: .number,
    ///             units: "dollars"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: UpdateMetricsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateMetricsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/metrics",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateMetricsResponse.self
        )
    }

    /// Get a metric by ID.
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
    ///     _ = try await client.admin.metrics.get(id: "550e8400-e29b-41d4-a716-446655440000")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The UUID of the metric to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> CreatedMetric {
        return try await httpClient.performRequest(
            method: .get,
            path: "/metrics/\(id)",
            requestOptions: requestOptions,
            responseType: CreatedMetric.self
        )
    }

    /// Submit up to 1,000 metric events for asynchronous processing.
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
    ///     _ = try await client.admin.metrics.batchEvents(request: [
    ///         BatchMetricEvent(
    ///             key: "words-written",
    ///             user: BatchMetricEventUser(
    ///                 id: "18",
    ///                 email: "user@example.com",
    ///                 tz: "Europe/London",
    ///                 attributes: [
    ///                     "department": "engineering", 
    ///                     "role": "developer"
    ///                 ]
    ///             ),
    ///             value: 750,
    ///             attributes: [
    ///                 "category": "writing", 
    ///                 "source": "mobile-app"
    ///             ],
    ///             idempotencyKey: "e4296e4b-8493-4bd1-9c30-5a1a9ac4d78f"
    ///         )
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func batchEvents(request: [BatchMetricEvent], requestOptions: RequestOptions? = nil) async throws -> BatchEventsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/metrics/events",
            body: request,
            requestOptions: requestOptions,
            responseType: BatchEventsResponse.self
        )
    }
}