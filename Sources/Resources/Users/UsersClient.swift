import Foundation

public final class UsersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Create a new user.
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
    ///     _ = try await client.users.create(request: UpsertedUser(
    ///         id: "user-id"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: UpsertedUser, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .post,
            path: "/users",
            body: request,
            requestOptions: requestOptions,
            responseType: User.self
        )
    }

    /// Get a single user.
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
    ///     _ = try await client.users.get(id: "userId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user to get.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)",
            requestOptions: requestOptions,
            responseType: User.self
        )
    }

    /// Identify a user.
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
    ///     _ = try await client.users.identify(
    ///         id: "id",
    ///         request: UpdatedUser(
    ///             email: "user@example.com",
    ///             tz: "Europe/London",
    ///             signUpDate: "2020-08-20",
    ///             attributes: [
    ///                 "department": "engineering", 
    ///                 "role": "developer"
    ///             ]
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user to identify.
    /// - Parameter request: The user object.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func identify(id: String, request: UpdatedUser, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .put,
            path: "/users/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: User.self
        )
    }

    /// Update a user.
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
    ///     _ = try await client.users.update(
    ///         id: "id",
    ///         request: UpdatedUser(
    ///             email: "user@example.com",
    ///             tz: "Europe/London",
    ///             attributes: [
    ///                 "department": "engineering", 
    ///                 "role": "developer"
    ///             ]
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user to update.
    /// - Parameter request: The user object.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: UpdatedUser, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/users/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: User.self
        )
    }

    /// Get a user's notification preferences.
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
    ///     _ = try await client.users.getPreferences(id: "user-123")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The user's ID in your database.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getPreferences(id: String, requestOptions: RequestOptions? = nil) async throws -> UserPreferencesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/preferences",
            requestOptions: requestOptions,
            responseType: UserPreferencesResponse.self
        )
    }

    /// Update a user's notification and streak preferences. Streak preferences other than `streak.enabled` require streak customization to be enabled in your Trophy dashboard settings.
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
    ///     _ = try await client.users.updatePreferences(
    ///         id: "user-123",
    ///         request: .init(notifications: NotificationPreferences(
    ///             streakReminder: [
    ///                 .email
    ///             ]
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The user's ID in your database.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updatePreferences(id: String, request: Requests.UpdateUserPreferencesRequest, requestOptions: RequestOptions? = nil) async throws -> UserPreferencesResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/users/\(id)/preferences",
            body: request,
            requestOptions: requestOptions,
            responseType: UserPreferencesResponse.self
        )
    }

    /// Get a single user's progress against all active metrics.
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
    ///     _ = try await client.users.allMetrics(id: "userId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func allMetrics(id: String, requestOptions: RequestOptions? = nil) async throws -> [MetricResponse] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/metrics",
            requestOptions: requestOptions,
            responseType: [MetricResponse].self
        )
    }

    /// Get a user's progress against a single active metric.
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
    ///     _ = try await client.users.singleMetric(
    ///         id: "userId",
    ///         key: "key"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user.
    /// - Parameter key: Unique key of the metric.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func singleMetric(id: String, key: String, requestOptions: RequestOptions? = nil) async throws -> MetricResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/metrics/\(key)",
            requestOptions: requestOptions,
            responseType: MetricResponse.self
        )
    }

    /// Get a summary of metric events over time for a user.
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
    ///     _ = try await client.users.metricEventSummary(
    ///         id: "userId",
    ///         key: "words-written",
    ///         aggregation: .daily,
    ///         startDate: "2024-01-01",
    ///         endDate: "2024-01-31"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user.
    /// - Parameter key: Unique key of the metric.
    /// - Parameter aggregation: The time period over which to aggregate the event data.
    /// - Parameter startDate: The start date for the data range in YYYY-MM-DD format. The startDate must be before the endDate, and the date range must not exceed 400 days.
    /// - Parameter endDate: The end date for the data range in YYYY-MM-DD format. The endDate must be after the startDate, and the date range must not exceed 400 days.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func metricEventSummary(id: String, key: String, aggregation: UsersMetricEventSummaryRequestAggregation, startDate: String, endDate: String, requestOptions: RequestOptions? = nil) async throws -> [UsersMetricEventSummaryResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/metrics/\(key)/event-summary",
            queryParams: [
                "aggregation": .string(aggregation.rawValue), 
                "startDate": .string(startDate), 
                "endDate": .string(endDate)
            ],
            requestOptions: requestOptions,
            responseType: [UsersMetricEventSummaryResponseItem].self
        )
    }

    /// Get a user's achievements.
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
    ///     _ = try await client.users.achievements(
    ///         id: "userId",
    ///         includeIncomplete: .true
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user.
    /// - Parameter includeIncomplete: When set to 'true', returns both completed and incomplete achievements for the user. When omitted or set to any other value, returns only completed achievements.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func achievements(id: String, includeIncomplete: True? = nil, requestOptions: RequestOptions? = nil) async throws -> [UserAchievementWithStatsResponse] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/achievements",
            queryParams: [
                "includeIncomplete": includeIncomplete.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: [UserAchievementWithStatsResponse].self
        )
    }

    /// Get a user's streak data.
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
    ///     _ = try await client.users.streak(
    ///         id: "userId",
    ///         historyPeriods: 1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user.
    /// - Parameter historyPeriods: The number of past streak periods to include in the streakHistory field of the  response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func streak(id: String, historyPeriods: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> StreakResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/streak",
            queryParams: [
                "historyPeriods": historyPeriods.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: StreakResponse.self
        )
    }

    /// Get a user's points for a specific points system.
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
    ///     _ = try await client.users.points(
    ///         id: "userId",
    ///         key: "points-system-key",
    ///         awards: 1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user.
    /// - Parameter key: Key of the points system.
    /// - Parameter awards: The number of recent point awards to return.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func points(id: String, key: String, awards: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> GetUserPointsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/points/\(key)",
            queryParams: [
                "awards": awards.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetUserPointsResponse.self
        )
    }

    /// Get active points boosts for a user in a specific points system. Returns both global boosts the user is eligible for and user-specific boosts.
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
    ///     _ = try await client.users.pointsBoosts(
    ///         id: "userId",
    ///         key: "points-system-key"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user.
    /// - Parameter key: Key of the points system.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pointsBoosts(id: String, key: String, requestOptions: RequestOptions? = nil) async throws -> [PointsBoost] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/points/\(key)/boosts",
            requestOptions: requestOptions,
            responseType: [PointsBoost].self
        )
    }

    /// Get a summary of points awards over time for a user for a specific points system.
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
    ///     _ = try await client.users.pointsEventSummary(
    ///         id: "userId",
    ///         key: "points-system-key",
    ///         aggregation: .daily,
    ///         startDate: "2024-01-01",
    ///         endDate: "2024-01-31"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the user.
    /// - Parameter key: Key of the points system.
    /// - Parameter aggregation: The time period over which to aggregate the event data.
    /// - Parameter startDate: The start date for the data range in YYYY-MM-DD format. The startDate must be before the endDate, and the date range must not exceed 400 days.
    /// - Parameter endDate: The end date for the data range in YYYY-MM-DD format. The endDate must be after the startDate, and the date range must not exceed 400 days.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pointsEventSummary(id: String, key: String, aggregation: UsersPointsEventSummaryRequestAggregation, startDate: String, endDate: String, requestOptions: RequestOptions? = nil) async throws -> [UsersPointsEventSummaryResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/points/\(key)/event-summary",
            queryParams: [
                "aggregation": .string(aggregation.rawValue), 
                "startDate": .string(startDate), 
                "endDate": .string(endDate)
            ],
            requestOptions: requestOptions,
            responseType: [UsersPointsEventSummaryResponseItem].self
        )
    }

    /// Get a user's rank, value, and daily ranking history for a specific leaderboard.
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
    ///     _ = try await client.users.leaderboard(
    ///         id: "user-123",
    ///         key: "weekly-words",
    ///         run: "2025-01-15",
    ///         numEvents: 1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The user's ID in your database.
    /// - Parameter key: Unique key of the leaderboard as set when created.
    /// - Parameter run: Specific run date in YYYY-MM-DD format. If not provided, returns the current run.
    /// - Parameter numEvents: The number of days to return in the leaderboard history for the user.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func leaderboard(id: String, key: String, run: String? = nil, numEvents: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> UserLeaderboardResponseWithHistory {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/leaderboards/\(key)",
            queryParams: [
                "run": run.map { .string($0) }, 
                "numEvents": numEvents.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: UserLeaderboardResponseWithHistory.self
        )
    }

    /// Get a user's year-in-review wrapped data.
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
    ///     _ = try await client.users.wrapped(
    ///         id: "user-123",
    ///         year: 1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The user's ID in your database.
    /// - Parameter year: The year to get wrapped data for. Defaults to the current year. Must be an integer between 1 and the current year.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func wrapped(id: String, year: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> WrappedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/wrapped",
            queryParams: [
                "year": year.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: WrappedResponse.self
        )
    }

    public enum True: String, Codable, Hashable, CaseIterable, Sendable {
        case `true`
    }
}