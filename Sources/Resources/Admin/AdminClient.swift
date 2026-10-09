import Foundation

public final class AdminClient: Sendable {
    public let attributes: AttributesClient
    public let achievements: AdminAchievementsClient
    public let metrics: AdminMetricsClient
    public let leaderboards: AdminLeaderboardsClient
    public let streaks: AdminStreaksClient
    public let settings: SettingsClient
    public let applicationApiKeys: ApplicationApiKeysClient
    public let environments: EnvironmentsClient
    public let tenants: TenantsClient
    public let points: AdminPointsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.attributes = AttributesClient(config: config)
        self.achievements = AdminAchievementsClient(config: config)
        self.metrics = AdminMetricsClient(config: config)
        self.leaderboards = AdminLeaderboardsClient(config: config)
        self.streaks = AdminStreaksClient(config: config)
        self.settings = SettingsClient(config: config)
        self.applicationApiKeys = ApplicationApiKeysClient(config: config)
        self.environments = EnvironmentsClient(config: config)
        self.tenants = TenantsClient(config: config)
        self.points = AdminPointsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }
}