import Foundation

public final class SettingsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Get branding, experimentation, and aggregation settings.
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
    ///     _ = try await client.admin.settings.get()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(requestOptions: RequestOptions? = nil) async throws -> AdminSettings {
        return try await httpClient.performRequest(
            method: .get,
            path: "/settings",
            requestOptions: requestOptions,
            responseType: AdminSettings.self
        )
    }

    /// Update branding, experimentation, and aggregation settings.
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
    ///     _ = try await client.admin.settings.update(request: .init(
    ///         branding: UpdateAdminSettingsBranding(
    ///             appName: "Trophy",
    ///             appUrl: "https://app.example.com",
    ///             brandColor: "#1a2b3c",
    ///             logo: UpdateAdminSettingsBrandingLogo(
    ///                 url: "https://cdn.example.com/logo.png"
    ///             )
    ///         ),
    ///         experimentation: UpdateAdminSettingsExperimentation(
    ///             controlRatio: 10,
    ///             userActivationWindow: 14
    ///         ),
    ///         aggregationPeriod: .weekly
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: Requests.UpdateAdminSettingsRequest, requestOptions: RequestOptions? = nil) async throws -> AdminSettings {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/settings",
            body: request,
            requestOptions: requestOptions,
            responseType: AdminSettings.self
        )
    }
}