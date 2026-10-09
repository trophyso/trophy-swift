import Foundation

public final class MetricsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Increment or decrement the value of a metric for a user.
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
    ///     _ = try await client.metrics.event(
    ///         key: "words-written",
    ///         idempotencyKey: "e4296e4b-8493-4bd1-9c30-5a1a9ac4d78f",
    ///         request: .init(
    ///             user: UpsertedUser(
    ///                 email: "user@example.com",
    ///                 tz: "Europe/London",
    ///                 attributes: [
    ///                     "department": "engineering", 
    ///                     "role": "developer"
    ///                 ],
    ///                 id: "18"
    ///             ),
    ///             value: 750,
    ///             attributes: [
    ///                 "category": "writing", 
    ///                 "source": "mobile-app"
    ///             ]
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter key: Unique reference of the metric as set when created.
    /// - Parameter idempotencyKey: The idempotency key for the event.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func event(key: String, idempotencyKey: String? = nil, request: Requests.MetricsEventRequest, requestOptions: RequestOptions? = nil) async throws -> EventResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/metrics/\(key)/event",
            headers: [
                "Idempotency-Key": idempotencyKey
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: EventResponse.self
        )
    }
}