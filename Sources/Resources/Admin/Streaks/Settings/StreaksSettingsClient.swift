import Foundation

public final class StreaksSettingsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Get the organization's streak configuration.
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
    ///     _ = try await client.admin.streaks.settings.get()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(requestOptions: RequestOptions? = nil) async throws -> StreakSettings {
        return try await httpClient.performRequest(
            method: .get,
            path: "/streaks/settings",
            requestOptions: requestOptions,
            responseType: StreakSettings.self
        )
    }

    /// Update the organization's streak configuration.
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
    ///     _ = try await client.admin.streaks.settings.update(request: .init(
    ///         frequency: .daily,
    ///         evaluationMode: .or,
    ///         customizationEnabled: true,
    ///         daysOff: [
    ///             0,
    ///             6
    ///         ],
    ///         metrics: [
    ///             StreakSettingsMetric(
    ///                 key: "words-written",
    ///                 threshold: 500
    ///             )
    ///         ],
    ///         freezes: UpdateStreakSettingsFreezes(
    ///             startCount: 1,
    ///             maxCount: 2,
    ///             autoEarnInterval: 7,
    ///             autoEarnAmount: 1
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: Requests.UpdateStreakSettingsRequest, requestOptions: RequestOptions? = nil) async throws -> StreakSettings {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/streaks/settings",
            body: request,
            requestOptions: requestOptions,
            responseType: StreakSettings.self
        )
    }
}