import Foundation

/// Use this class to access the different functions within the SDK. You can instantiate any number of clients with different configuration that will propagate to these functions.
public final class TrophyApiClient: Sendable {
    public let achievements: AchievementsClient
    public let metrics: MetricsClient
    public let users: UsersClient
    public let streaks: StreaksClient
    public let points: PointsClient
    public let leaderboards: LeaderboardsClient
    public let admin: AdminClient
    private let httpClient: HTTPClient

    /// Initialize the client with the specified configuration.
    ///
    /// - Parameter baseURL: The base URL to use for requests from the client. If not provided, the default base URL will be used.
    /// - Parameter apiKey: The API key to use for authentication.
    /// - Parameter tenantId: The tenant identifier for multi-tenant organisations. Required when the organisation has multi-tenancy enabled. The value should be your internal ID for the tenant. Ignored for single-tenant organisations.
    /// - Parameter headers: Additional headers to send with each request.
    /// - Parameter timeout: Request timeout in seconds. Defaults to 60 seconds. Ignored if a custom `urlSession` is provided.
    /// - Parameter maxRetries: Maximum number of retries for failed requests. Defaults to 2.
    /// - Parameter urlSession: Custom `URLSession` to use for requests. If not provided, a default session will be created with the specified timeout.
    public convenience init(
        baseURL: String = "https://api.trophy.so/v1",
        apiKey: String,
        sdkVersion: String,
        tenantId: String? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        var mergedHeaders = headers ?? [:]
        mergedHeaders["X-SDK-VERSION"] = sdkVersion
        if let tenantId = tenantId {
            mergedHeaders["Tenant-ID"] = tenantId
        }
        self.init(
            baseURL: baseURL,
            headerAuth: .init(
                key: apiKey,
                header: "X-API-KEY"
            ),
            bearerAuth: nil,
            basicAuth: nil,
            headers: mergedHeaders,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
    }

    init(
        baseURL: String = "https://api.trophy.so/v1",
        headerAuth: ClientConfig.HeaderAuth? = nil,
        bearerAuth: ClientConfig.BearerAuth? = nil,
        basicAuth: ClientConfig.BasicAuth? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        let config = ClientConfig(
            baseURL: baseURL,
            headerAuth: headerAuth,
            bearerAuth: bearerAuth,
            basicAuth: basicAuth,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
        self.achievements = AchievementsClient(config: config)
        self.metrics = MetricsClient(config: config)
        self.users = UsersClient(config: config)
        self.streaks = StreaksClient(config: config)
        self.points = PointsClient(config: config)
        self.leaderboards = LeaderboardsClient(config: config)
        self.admin = AdminClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }
}