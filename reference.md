# Reference
## Achievements
<details><summary><code>client.achievements.<a href="/Sources/Resources/Achievements/AchievementsClient.swift">all</a>(userAttributes: String?, requestOptions: RequestOptions?) -> [AchievementWithStatsResponse]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all achievements and their completion stats.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.achievements.all(userAttributes: "plan-type:premium,region:us-east")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**userAttributes:** `String?` — Optional colon-delimited user attributes in the format attribute:value,attribute:value. Only achievements accessible to a user with the provided attributes will be returned.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.achievements.<a href="/Sources/Resources/Achievements/AchievementsClient.swift">complete</a>(key: String, request: Requests.AchievementsCompleteRequest, requestOptions: RequestOptions?) -> AchievementCompletionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mark an achievement as completed for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.achievements.complete(
        key: "finish-onboarding",
        request: .init(user: UpsertedUser(
            email: "user@example.com",
            tz: "Europe/London",
            id: "user-id"
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Unique reference of the achievement as set when created.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AchievementsCompleteRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Metrics
<details><summary><code>client.metrics.<a href="/Sources/Resources/Metrics/MetricsClient.swift">event</a>(key: String, idempotencyKey: String?, request: Requests.MetricsEventRequest, requestOptions: RequestOptions?) -> EventResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Increment or decrement the value of a metric for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.metrics.event(
        key: "words-written",
        idempotencyKey: "e4296e4b-8493-4bd1-9c30-5a1a9ac4d78f",
        request: .init(
            user: UpsertedUser(
                email: "user@example.com",
                tz: "Europe/London",
                attributes: [
                    "department": "engineering", 
                    "role": "developer"
                ],
                id: "18"
            ),
            value: 750,
            attributes: [
                "category": "writing", 
                "source": "mobile-app"
            ]
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Unique reference of the metric as set when created.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String?` — The idempotency key for the event.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.MetricsEventRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users
<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">create</a>(request: UpsertedUser, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.create(request: UpsertedUser(
        id: "user-id"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `UpsertedUser` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">get</a>(id: String, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.get(id: "userId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to get.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">identify</a>(id: String, request: UpdatedUser, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Identify a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.identify(
        id: "id",
        request: UpdatedUser(
            email: "user@example.com",
            tz: "Europe/London",
            signUpDate: "2020-08-20",
            attributes: [
                "department": "engineering", 
                "role": "developer"
            ]
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to identify.
    
</dd>
</dl>

<dl>
<dd>

**request:** `UpdatedUser` — The user object.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">update</a>(id: String, request: UpdatedUser, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.update(
        id: "id",
        request: UpdatedUser(
            email: "user@example.com",
            tz: "Europe/London",
            attributes: [
                "department": "engineering", 
                "role": "developer"
            ]
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `UpdatedUser` — The user object.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">getPreferences</a>(id: String, requestOptions: RequestOptions?) -> UserPreferencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's notification preferences.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.getPreferences(id: "user-123")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user's ID in your database.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">updatePreferences</a>(id: String, request: Requests.UpdateUserPreferencesRequest, requestOptions: RequestOptions?) -> UserPreferencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a user's notification and streak preferences. Streak preferences other than `streak.enabled` require streak customization to be enabled in your Trophy dashboard settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.updatePreferences(
        id: "user-123",
        request: .init(notifications: NotificationPreferences(
            streakReminder: [
                .email
            ]
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user's ID in your database.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateUserPreferencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">allMetrics</a>(id: String, requestOptions: RequestOptions?) -> [MetricResponse]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single user's progress against all active metrics.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.allMetrics(id: "userId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">singleMetric</a>(id: String, key: String, requestOptions: RequestOptions?) -> MetricResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's progress against a single active metric.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.singleMetric(
        id: "userId",
        key: "key"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Unique key of the metric.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">metricEventSummary</a>(id: String, key: String, aggregation: UsersMetricEventSummaryRequestAggregation, startDate: String, endDate: String, requestOptions: RequestOptions?) -> [UsersMetricEventSummaryResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a summary of metric events over time for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.metricEventSummary(
        id: "userId",
        key: "words-written",
        aggregation: .daily,
        startDate: "2024-01-01",
        endDate: "2024-01-31"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Unique key of the metric.
    
</dd>
</dl>

<dl>
<dd>

**aggregation:** `UsersMetricEventSummaryRequestAggregation` — The time period over which to aggregate the event data.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `String` — The start date for the data range in YYYY-MM-DD format. The startDate must be before the endDate, and the date range must not exceed 400 days.
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `String` — The end date for the data range in YYYY-MM-DD format. The endDate must be after the startDate, and the date range must not exceed 400 days.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">achievements</a>(id: String, includeIncomplete: JSONValue?, requestOptions: RequestOptions?) -> [UserAchievementWithStatsResponse]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's achievements.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.achievements(
        id: "userId",
        includeIncomplete: .true
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**includeIncomplete:** `JSONValue?` — When set to 'true', returns both completed and incomplete achievements for the user. When omitted or set to any other value, returns only completed achievements.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">streak</a>(id: String, historyPeriods: Int?, requestOptions: RequestOptions?) -> StreakResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's streak data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.streak(
        id: "userId",
        historyPeriods: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**historyPeriods:** `Int?` — The number of past streak periods to include in the streakHistory field of the  response.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">points</a>(id: String, key: String, awards: Int?, requestOptions: RequestOptions?) -> GetUserPointsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's points for a specific points system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.points(
        id: "userId",
        key: "points-system-key",
        awards: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**awards:** `Int?` — The number of recent point awards to return.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">pointsBoosts</a>(id: String, key: String, requestOptions: RequestOptions?) -> [PointsBoost]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get active points boosts for a user in a specific points system. Returns both global boosts the user is eligible for and user-specific boosts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.pointsBoosts(
        id: "userId",
        key: "points-system-key"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">pointsEventSummary</a>(id: String, key: String, aggregation: UsersPointsEventSummaryRequestAggregation, startDate: String, endDate: String, requestOptions: RequestOptions?) -> [UsersPointsEventSummaryResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a summary of points awards over time for a user for a specific points system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.pointsEventSummary(
        id: "userId",
        key: "points-system-key",
        aggregation: .daily,
        startDate: "2024-01-01",
        endDate: "2024-01-31"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**aggregation:** `UsersPointsEventSummaryRequestAggregation` — The time period over which to aggregate the event data.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `String` — The start date for the data range in YYYY-MM-DD format. The startDate must be before the endDate, and the date range must not exceed 400 days.
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `String` — The end date for the data range in YYYY-MM-DD format. The endDate must be after the startDate, and the date range must not exceed 400 days.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">leaderboard</a>(id: String, key: String, run: String?, numEvents: Int?, requestOptions: RequestOptions?) -> UserLeaderboardResponseWithHistory</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's rank, value, and daily ranking history for a specific leaderboard.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.leaderboard(
        id: "user-123",
        key: "weekly-words",
        run: "2025-01-15",
        numEvents: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user's ID in your database.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Unique key of the leaderboard as set when created.
    
</dd>
</dl>

<dl>
<dd>

**run:** `String?` — Specific run date in YYYY-MM-DD format. If not provided, returns the current run.
    
</dd>
</dl>

<dl>
<dd>

**numEvents:** `Int?` — The number of days to return in the leaderboard history for the user.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">wrapped</a>(id: String, year: Int?, requestOptions: RequestOptions?) -> WrappedResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's year-in-review wrapped data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.users.wrapped(
        id: "user-123",
        year: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user's ID in your database.
    
</dd>
</dl>

<dl>
<dd>

**year:** `Int?` — The year to get wrapped data for. Defaults to the current year. Must be an integer between 1 and the current year.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Streaks
<details><summary><code>client.streaks.<a href="/Sources/Resources/Streaks/StreaksClient.swift">list</a>(userIds: [String]?, requestOptions: RequestOptions?) -> BulkStreakResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get the streak lengths of a list of users, ranked by streak length from longest to shortest.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.streaks.list(userIds: [
        "userIds"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**userIds:** `[String]?` — A list of up to 100 user IDs.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Points
<details><summary><code>client.points.<a href="/Sources/Resources/Points/PointsClient.swift">summary</a>(key: String, userAttributes: String?, requestOptions: RequestOptions?) -> PointsSummaryResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a breakdown of the number of users with points in each range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.points.summary(
        key: "points-system-key",
        userAttributes: "plan-type:premium,region:us-east"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**userAttributes:** `String?` — Optional colon-delimited user attribute filters in the format attribute:value,attribute:value. Only users matching ALL specified attributes will be included in the points breakdown.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.points.<a href="/Sources/Resources/Points/PointsClient.swift">system</a>(key: String, requestOptions: RequestOptions?) -> PointsSystemResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a points system with its triggers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.points.system(key: "points-system-key")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.points.<a href="/Sources/Resources/Points/PointsClient.swift">boosts</a>(key: String, includeFinished: Bool?, requestOptions: RequestOptions?) -> [PointsBoost]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all global boosts for a points system. Finished boosts are excluded by default.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.points.boosts(
        key: "points-system-key",
        includeFinished: true
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**includeFinished:** `Bool?` — When set to 'true', boosts that have finished (past their end date) will be included in the response. By default, finished boosts are excluded.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.points.<a href="/Sources/Resources/Points/PointsClient.swift">levels</a>(key: String, requestOptions: RequestOptions?) -> [PointsLevel]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all levels for a points system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.points.levels(key: "points-system-key")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.points.<a href="/Sources/Resources/Points/PointsClient.swift">levelSummary</a>(key: String, requestOptions: RequestOptions?) -> PointsLevelSummaryResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a breakdown of the number of users at each level in a points system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.points.levelSummary(key: "points-system-key")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Leaderboards
<details><summary><code>client.leaderboards.<a href="/Sources/Resources/Leaderboards/LeaderboardsClient.swift">all</a>(includeFinished: Bool?, requestOptions: RequestOptions?) -> [LeaderboardsAllResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all leaderboards for your organization. Finished leaderboards are excluded by default.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.leaderboards.all(includeFinished: true)
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**includeFinished:** `Bool?` — When set to 'true', leaderboards with status 'finished' will be included in the response. By default, finished leaderboards are excluded.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.leaderboards.<a href="/Sources/Resources/Leaderboards/LeaderboardsClient.swift">get</a>(key: String, offset: Int?, limit: Int?, run: String?, userId: String?, userAttributes: String?, requestOptions: RequestOptions?) -> LeaderboardResponseWithRankings</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a specific leaderboard by its key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.leaderboards.get(
        key: "weekly-words",
        offset: 1,
        limit: 1,
        run: "2025-01-15",
        userId: "user-123",
        userAttributes: "city:London"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Unique key of the leaderboard as set when created.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Int?` — Number of rankings to skip for pagination.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — Maximum number of rankings to return. Cannot be greater than the size of the leaderboard.
    
</dd>
</dl>

<dl>
<dd>

**run:** `String?` — Specific run date in YYYY-MM-DD format. If not provided, returns the current run.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — When provided, offset is relative to this user's position on the leaderboard. If the user is not found in the leaderboard, returns empty rankings array.
    
</dd>
</dl>

<dl>
<dd>

**userAttributes:** `String?` — Attribute key and value to filter the rankings by, separated by a colon. For example, `city:London`. This parameter is required, and only valid for leaderboards with a breakdown attribute.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Attributes
<details><summary><code>client.admin.attributes.<a href="/Sources/Resources/Admin/Attributes/AttributesClient.swift">list</a>(limit: Int?, skip: Int?, requestOptions: RequestOptions?) -> ListAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List attributes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.attributes.list(
        limit: 1,
        skip: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Int?` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.attributes.<a href="/Sources/Resources/Admin/Attributes/AttributesClient.swift">create</a>(request: CreateAttributesRequest, requestOptions: RequestOptions?) -> CreateAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create attributes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.attributes.create(request: [
        CreateAttributeRequestItem(
            name: "Plan",
            key: "plan",
            type: .user
        ),
        CreateAttributeRequestItem(
            name: "Device",
            key: "device",
            type: .event
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateAttributesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.attributes.<a href="/Sources/Resources/Admin/Attributes/AttributesClient.swift">delete</a>(ids: [String]?, requestOptions: RequestOptions?) -> DeleteAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete attributes by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.attributes.delete(ids: [
        "550e8400-e29b-41d4-a716-446655440000",
        "550e8400-e29b-41d4-a716-446655440001"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[String]?` — Attribute IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.attributes.<a href="/Sources/Resources/Admin/Attributes/AttributesClient.swift">update</a>(request: UpdateAttributesRequest, requestOptions: RequestOptions?) -> UpdateAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update attributes by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.attributes.update(request: [
        UpdateAttributeRequestItem(
            id: "550e8400-e29b-41d4-a716-446655440000",
            name: "Subscription Plan"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `UpdateAttributesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.attributes.<a href="/Sources/Resources/Admin/Attributes/AttributesClient.swift">get</a>(id: String, requestOptions: RequestOptions?) -> AdminAttribute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get an attribute by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.attributes.get(id: "550e8400-e29b-41d4-a716-446655440000")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID of the attribute to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Achievements
<details><summary><code>client.admin.achievements.<a href="/Sources/Resources/Admin/Achievements/AdminAchievementsClient.swift">list</a>(limit: Int?, skip: Int?, requestOptions: RequestOptions?) -> ListAchievementsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List achievements.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.achievements.list(
        limit: 1,
        skip: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Int?` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.achievements.<a href="/Sources/Resources/Admin/Achievements/AdminAchievementsClient.swift">create</a>(request: CreateAchievementsRequest, requestOptions: RequestOptions?) -> CreateAchievementsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create achievements. Trigger-specific fields are required based on `trigger`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.achievements.create(request: [
        CreateAchievementRequestItem(
            name: "First Workout",
            trigger: .metric,
            metricId: "660f9500-f30c-42e5-b827-557766550001",
            metricValue: 1
        ),
        CreateAchievementRequestItem(
            name: "Custom Unlock",
            trigger: .api,
            key: "custom-unlock"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateAchievementsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.achievements.<a href="/Sources/Resources/Admin/Achievements/AdminAchievementsClient.swift">delete</a>(ids: [String]?, requestOptions: RequestOptions?) -> DeleteAchievementsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete achievements by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.achievements.delete(ids: [
        "550e8400-e29b-41d4-a716-446655440000",
        "550e8400-e29b-41d4-a716-446655440001"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[String]?` — Achievement IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.achievements.<a href="/Sources/Resources/Admin/Achievements/AdminAchievementsClient.swift">update</a>(request: UpdateAchievementsRequest, requestOptions: RequestOptions?) -> UpdateAchievementsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update achievements by ID. Maximum 100 achievements per request. Only provided fields are updated; omitted fields are preserved.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.achievements.update(request: [
        UpdateAchievementRequestItem(
            id: "550e8400-e29b-41d4-a716-446655440000",
            name: "First Workout Completed",
            status: .active
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `UpdateAchievementsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.achievements.<a href="/Sources/Resources/Admin/Achievements/AdminAchievementsClient.swift">get</a>(id: String, requestOptions: RequestOptions?) -> AdminAchievement</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get an achievement by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.achievements.get(id: "550e8400-e29b-41d4-a716-446655440000")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID of the achievement to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Metrics
<details><summary><code>client.admin.metrics.<a href="/Sources/Resources/Admin/Metrics/AdminMetricsClient.swift">list</a>(limit: Int?, skip: Int?, requestOptions: RequestOptions?) -> ListMetricsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List metrics.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.metrics.list(
        limit: 1,
        skip: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Int?` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/Sources/Resources/Admin/Metrics/AdminMetricsClient.swift">create</a>(request: CreateMetricsRequest, requestOptions: RequestOptions?) -> CreateMetricsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create metrics.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.metrics.create(request: [
        CreateMetricRequestItem(
            name: "Invites Sent",
            key: "invites-sent"
        ),
        CreateMetricRequestItem(
            name: "Revenue",
            key: "revenue",
            unitType: .currency,
            units: "USD"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateMetricsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/Sources/Resources/Admin/Metrics/AdminMetricsClient.swift">delete</a>(ids: [String]?, requestOptions: RequestOptions?) -> DeleteMetricsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete metrics by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.metrics.delete(ids: [
        "550e8400-e29b-41d4-a716-446655440000",
        "550e8400-e29b-41d4-a716-446655440001"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[String]?` — Metric IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/Sources/Resources/Admin/Metrics/AdminMetricsClient.swift">update</a>(request: UpdateMetricsRequest, requestOptions: RequestOptions?) -> UpdateMetricsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update metrics by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.metrics.update(request: [
        UpdateMetricRequestItem(
            id: "550e8400-e29b-41d4-a716-446655440000",
            name: "Invites Completed",
            units: "invites"
        ),
        UpdateMetricRequestItem(
            id: "550e8400-e29b-41d4-a716-446655440001",
            unitType: .number,
            units: "dollars"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `UpdateMetricsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/Sources/Resources/Admin/Metrics/AdminMetricsClient.swift">get</a>(id: String, requestOptions: RequestOptions?) -> CreatedMetric</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a metric by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.metrics.get(id: "550e8400-e29b-41d4-a716-446655440000")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID of the metric to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/Sources/Resources/Admin/Metrics/AdminMetricsClient.swift">batchEvents</a>(request: [BatchMetricEvent], requestOptions: RequestOptions?) -> BatchEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit up to 1,000 metric events for asynchronous processing.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.metrics.batchEvents(request: [
        BatchMetricEvent(
            key: "words-written",
            user: BatchMetricEventUser(
                id: "18",
                email: "user@example.com",
                tz: "Europe/London",
                attributes: [
                    "department": "engineering", 
                    "role": "developer"
                ]
            ),
            value: 750,
            attributes: [
                "category": "writing", 
                "source": "mobile-app"
            ],
            idempotencyKey: "e4296e4b-8493-4bd1-9c30-5a1a9ac4d78f"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `[BatchMetricEvent]` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Leaderboards
<details><summary><code>client.admin.leaderboards.<a href="/Sources/Resources/Admin/Leaderboards/AdminLeaderboardsClient.swift">list</a>(limit: Int?, skip: Int?, requestOptions: RequestOptions?) -> ListLeaderboardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List leaderboards.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.leaderboards.list(
        limit: 1,
        skip: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Int?` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.leaderboards.<a href="/Sources/Resources/Admin/Leaderboards/AdminLeaderboardsClient.swift">create</a>(request: CreateLeaderboardsRequest, requestOptions: RequestOptions?) -> CreateLeaderboardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create leaderboards.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.leaderboards.create(request: [
        CreateLeaderboardRequestItem(
            name: "Revenue Champions",
            key: "revenue-champions",
            status: .inactive,
            rankBy: .metric,
            metricId: "550e8400-e29b-41d4-a716-446655440000",
            maxParticipants: 100,
            start: "2026-04-20",
            breakdownAttributes: [
                "550e8400-e29b-41d4-a716-446655440010"
            ],
            runUnit: .month,
            runInterval: 1
        ),
        CreateLeaderboardRequestItem(
            name: "Streak Legends",
            key: "streak-legends",
            status: .scheduled,
            rankBy: .streak,
            start: "2026-04-27"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateLeaderboardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.leaderboards.<a href="/Sources/Resources/Admin/Leaderboards/AdminLeaderboardsClient.swift">delete</a>(ids: [String]?, requestOptions: RequestOptions?) -> DeleteLeaderboardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete leaderboards by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.leaderboards.delete(ids: [
        "ids"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[String]?` — Leaderboard IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.leaderboards.<a href="/Sources/Resources/Admin/Leaderboards/AdminLeaderboardsClient.swift">update</a>(request: UpdateLeaderboardsRequest, requestOptions: RequestOptions?) -> UpdateLeaderboardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update leaderboards by ID. Updating `status` behaves the same as activating, scheduling, deactivating, or finishing a leaderboard in the dashboard.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.leaderboards.update(request: [
        UpdateLeaderboardRequestItem(
            id: "550e8400-e29b-41d4-a716-446655440100",
            name: "Monthly Revenue Champions",
            description: "Ranked by monthly revenue",
            status: .active
        ),
        UpdateLeaderboardRequestItem(
            id: "550e8400-e29b-41d4-a716-446655440101",
            status: .finished
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `UpdateLeaderboardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.leaderboards.<a href="/Sources/Resources/Admin/Leaderboards/AdminLeaderboardsClient.swift">get</a>(id: String, requestOptions: RequestOptions?) -> AdminLeaderboard</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a leaderboard by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.leaderboards.get(id: "550e8400-e29b-41d4-a716-446655440100")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID of the leaderboard to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Streaks
<details><summary><code>client.admin.streaks.<a href="/Sources/Resources/Admin/Streaks/AdminStreaksClient.swift">restore</a>(request: Requests.RestoreStreaksRequest, requestOptions: RequestOptions?) -> RestoreStreaksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Restore streaks for multiple users to the maximum previously achieved streak length found within the current restore window: the last 90 days for daily streaks, weekly periods starting with the week containing the start of the current calendar year for weekly streaks, and monthly periods starting at the beginning of the previous calendar year for monthly streaks.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.streaks.restore(request: .init(users: [
        RestoreStreaksRequestUsersItem(
            id: "user-123"
        ),
        RestoreStreaksRequestUsersItem(
            id: "user-456"
        )
    ]))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.RestoreStreaksRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.streaks.<a href="/Sources/Resources/Admin/Streaks/AdminStreaksClient.swift">reset</a>(request: Requests.ResetStreaksRequest, requestOptions: RequestOptions?) -> ResetStreaksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reset the current streak to zero for multiple users.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.streaks.reset(request: .init(users: [
        ResetStreaksRequestUsersItem(
            id: "user-123"
        ),
        ResetStreaksRequestUsersItem(
            id: "user-456"
        )
    ]))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ResetStreaksRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Settings
<details><summary><code>client.admin.settings.<a href="/Sources/Resources/Admin/Settings/SettingsClient.swift">get</a>(requestOptions: RequestOptions?) -> AdminSettings</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get branding, experimentation, and aggregation settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.settings.get()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.settings.<a href="/Sources/Resources/Admin/Settings/SettingsClient.swift">update</a>(request: Requests.UpdateAdminSettingsRequest, requestOptions: RequestOptions?) -> AdminSettings</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update branding, experimentation, and aggregation settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.settings.update(request: .init(
        branding: UpdateAdminSettingsBranding(
            appName: "Trophy",
            appUrl: "https://app.example.com",
            brandColor: "#1a2b3c",
            logo: UpdateAdminSettingsBrandingLogo(
                url: "https://cdn.example.com/logo.png"
            )
        ),
        experimentation: UpdateAdminSettingsExperimentation(
            controlRatio: 10,
            userActivationWindow: 14
        ),
        aggregationPeriod: .weekly
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.UpdateAdminSettingsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin ApplicationApiKeys
<details><summary><code>client.admin.applicationApiKeys.<a href="/Sources/Resources/Admin/ApplicationApiKeys/ApplicationApiKeysClient.swift">create</a>(request: CreateApplicationKeysRequest, requestOptions: RequestOptions?) -> CreateApplicationKeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create application API keys scoped to specific users. Each key can only perform operations on behalf of the user it was created for.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.applicationApiKeys.create(request: [
        CreateApplicationKeyRequestItem(
            userId: "user_123"
        ),
        CreateApplicationKeyRequestItem(
            userId: "user_456"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateApplicationKeysRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.applicationApiKeys.<a href="/Sources/Resources/Admin/ApplicationApiKeys/ApplicationApiKeysClient.swift">delete</a>(ids: [String]?, requestOptions: RequestOptions?) -> DeleteApplicationKeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete application API keys by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.applicationApiKeys.delete(ids: [
        "550e8400-e29b-41d4-a716-446655440000"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[String]?` — Application API key IDs (UUIDs returned at creation time). Repeat the query param or provide a comma-separated list. Maximum 100 IDs per request.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Environments
<details><summary><code>client.admin.environments.<a href="/Sources/Resources/Admin/Environments/EnvironmentsClient.swift">list</a>(requestOptions: RequestOptions?) -> ListEnvironmentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List active environments.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.environments.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Tenants
<details><summary><code>client.admin.tenants.<a href="/Sources/Resources/Admin/Tenants/TenantsClient.swift">list</a>(limit: Int?, skip: Int?, requestOptions: RequestOptions?) -> ListTenantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List tenants in the current environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.tenants.list(
        limit: 1,
        skip: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Int?` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.tenants.<a href="/Sources/Resources/Admin/Tenants/TenantsClient.swift">create</a>(request: CreateTenantsRequest, requestOptions: RequestOptions?) -> CreateTenantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create tenants.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.tenants.create(request: [
        CreateTenantRequestItem(
            customerId: "customer_12345",
            name: "Acme Corp"
        ),
        CreateTenantRequestItem(
            customerId: "customer_67890",
            name: "Globex Inc"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateTenantsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.tenants.<a href="/Sources/Resources/Admin/Tenants/TenantsClient.swift">delete</a>(ids: [String]?, requestOptions: RequestOptions?) -> DeleteTenantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete tenants by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.tenants.delete(ids: [
        "550e8400-e29b-41d4-a716-446655440000",
        "550e8400-e29b-41d4-a716-446655440001"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[String]?` — Tenant IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.tenants.<a href="/Sources/Resources/Admin/Tenants/TenantsClient.swift">update</a>(request: UpdateTenantsRequest, requestOptions: RequestOptions?) -> UpdateTenantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update tenants by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.tenants.update(request: [
        UpdateTenantRequestItem(
            id: "550e8400-e29b-41d4-a716-446655440000",
            name: "Acme Corporation"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `UpdateTenantsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.tenants.<a href="/Sources/Resources/Admin/Tenants/TenantsClient.swift">get</a>(id: String, requestOptions: RequestOptions?) -> AdminTenant</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a tenant by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.tenants.get(id: "550e8400-e29b-41d4-a716-446655440000")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID of the tenant to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Points Systems
<details><summary><code>client.admin.points.systems.<a href="/Sources/Resources/Admin/Points/Systems/SystemsClient.swift">list</a>(limit: Int?, skip: Int?, requestOptions: RequestOptions?) -> ListPointsSystemsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List points systems.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.systems.list(
        limit: 1,
        skip: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Int?` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.systems.<a href="/Sources/Resources/Admin/Points/Systems/SystemsClient.swift">create</a>(request: CreatePointsSystemsRequest, requestOptions: RequestOptions?) -> CreatePointsSystemsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create points systems. Optionally include sub-entities (levels, boosts, triggers) in each system payload to create them alongside the system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.systems.create(request: [
        CreatePointsSystemRequestItem(
            name: "XP",
            key: "xp",
            description: "Experience points",
            levels: [
                CreatePointsLevelRequestItem(
                    name: "Bronze",
                    key: "bronze",
                    points: 100
                ),
                CreatePointsLevelRequestItem(
                    name: "Silver",
                    key: "silver",
                    points: 500
                )
            ]
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreatePointsSystemsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.systems.<a href="/Sources/Resources/Admin/Points/Systems/SystemsClient.swift">delete</a>(ids: [String]?, requestOptions: RequestOptions?) -> DeletePointsSystemsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete points systems by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.systems.delete(ids: [
        "550e8400-e29b-41d4-a716-446655440000"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[String]?` — The IDs of the points systems to delete.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.systems.<a href="/Sources/Resources/Admin/Points/Systems/SystemsClient.swift">update</a>(request: UpdatePointsSystemsRequest, requestOptions: RequestOptions?) -> UpdatePointsSystemsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update points systems by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.systems.update(request: [
        UpdatePointsSystemRequestItem(
            id: "550e8400-e29b-41d4-a716-446655440000",
            name: "New Name"
        )
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `UpdatePointsSystemsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.systems.<a href="/Sources/Resources/Admin/Points/Systems/SystemsClient.swift">get</a>(id: String, requestOptions: RequestOptions?) -> AdminPointsSystem</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a points system by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.systems.get(id: "550e8400-e29b-41d4-a716-446655440000")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Points Boosts
<details><summary><code>client.admin.points.boosts.<a href="/Sources/Resources/Admin/Points/Boosts/BoostsClient.swift">list</a>(systemId: String, limit: Int?, skip: Int?, requestOptions: RequestOptions?) -> ListPointsBoostsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List points boosts for a system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.boosts.list(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        limit: 1,
        skip: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — Maximum number of results to return (1-100, default 10).
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Int?` — Number of results to skip for pagination (default 0).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.boosts.<a href="/Sources/Resources/Admin/Points/Boosts/BoostsClient.swift">create</a>(systemId: String, request: CreatePointsBoostsRequest, requestOptions: RequestOptions?) -> CreatePointsBoostsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create points boosts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.boosts.create(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        request: [
            CreatePointsBoostRequestItem(
                userId: "user-123",
                name: "Double XP Weekend",
                start: "2024-01-01",
                end: "2024-01-03",
                multiplier: 2
            )
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `CreatePointsBoostsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.boosts.<a href="/Sources/Resources/Admin/Points/Boosts/BoostsClient.swift">delete</a>(systemId: String, ids: [String]?, requestOptions: RequestOptions?) -> DeletePointsBoostsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete multiple points boosts by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.boosts.delete(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        ids: [
            "ids"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**ids:** `[String]?` — A list of up to 100 boost IDs.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.boosts.<a href="/Sources/Resources/Admin/Points/Boosts/BoostsClient.swift">update</a>(systemId: String, request: PatchPointsBoostsRequest, requestOptions: RequestOptions?) -> PatchPointsBoostsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update multiple points boosts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.boosts.update(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        request: [
            PatchPointsBoostsRequestItem(
                id: "550e8400-e29b-41d4-a716-446655440000",
                name: "Updated Boost Name",
                multiplier: 3
            )
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `PatchPointsBoostsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.boosts.<a href="/Sources/Resources/Admin/Points/Boosts/BoostsClient.swift">get</a>(systemId: String, id: String, requestOptions: RequestOptions?) -> AdminPointsBoost</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single points boost by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.boosts.get(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        id: "660f9500-f30c-42e5-b827-557766550001"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The UUID of the points boost.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Points Levels
<details><summary><code>client.admin.points.levels.<a href="/Sources/Resources/Admin/Points/Levels/LevelsClient.swift">list</a>(systemId: String, limit: Int?, skip: Int?, requestOptions: RequestOptions?) -> ListPointsLevelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List points levels for a system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.levels.list(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        limit: 1,
        skip: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Int?` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.levels.<a href="/Sources/Resources/Admin/Points/Levels/LevelsClient.swift">create</a>(systemId: String, request: CreatePointsLevelsRequest, requestOptions: RequestOptions?) -> CreatePointsLevelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create points levels.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.levels.create(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        request: [
            CreatePointsLevelRequestItem(
                name: "Bronze",
                key: "bronze",
                points: 100
            )
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `CreatePointsLevelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.levels.<a href="/Sources/Resources/Admin/Points/Levels/LevelsClient.swift">delete</a>(systemId: String, ids: [String]?, requestOptions: RequestOptions?) -> DeletePointsLevelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete multiple points levels by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.levels.delete(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        ids: [
            "ids"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**ids:** `[String]?` — Comma-separated list of level UUIDs to delete.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.levels.<a href="/Sources/Resources/Admin/Points/Levels/LevelsClient.swift">update</a>(systemId: String, request: PatchPointsLevelsRequest, requestOptions: RequestOptions?) -> PatchPointsLevelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update multiple points levels. Each item must include an ID. `key` cannot be changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.levels.update(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        request: [
            PatchPointsLevelsRequestItem(
                id: "550e8400-e29b-41d4-a716-446655440000"
            )
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `PatchPointsLevelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.levels.<a href="/Sources/Resources/Admin/Points/Levels/LevelsClient.swift">get</a>(systemId: String, id: String, requestOptions: RequestOptions?) -> AdminPointsLevel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single points level by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.levels.get(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        id: "660f9500-f30c-42e5-b827-557766550001"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The UUID of the points level.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Points Triggers
<details><summary><code>client.admin.points.triggers.<a href="/Sources/Resources/Admin/Points/Triggers/TriggersClient.swift">list</a>(systemId: String, limit: Int?, skip: Int?, requestOptions: RequestOptions?) -> ListPointsTriggersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List points triggers for a system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.triggers.list(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        limit: 1,
        skip: 1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — Maximum number of results to return (1-100, default 10).
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Int?` — Number of results to skip for pagination (default 0).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.triggers.<a href="/Sources/Resources/Admin/Points/Triggers/TriggersClient.swift">create</a>(systemId: String, request: CreatePointsTriggersRequest, requestOptions: RequestOptions?) -> CreatePointsTriggersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create points triggers in bulk.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.triggers.create(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        request: [
            CreatePointsTriggerRequestItem(
                type: .metric,
                points: 10
            )
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `CreatePointsTriggersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.triggers.<a href="/Sources/Resources/Admin/Points/Triggers/TriggersClient.swift">delete</a>(systemId: String, ids: [String]?, requestOptions: RequestOptions?) -> DeletePointsTriggersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete points triggers by ID. Maximum 100 trigger IDs per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.triggers.delete(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        ids: [
            "550e8400-e29b-41d4-a716-446655440000"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**ids:** `[String]?` — Trigger IDs to delete. Can be repeated or comma-separated.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.triggers.<a href="/Sources/Resources/Admin/Points/Triggers/TriggersClient.swift">update</a>(systemId: String, request: PatchPointsTriggersRequest, requestOptions: RequestOptions?) -> PatchPointsTriggersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update points triggers in bulk. Maximum 100 triggers per request. Only provided fields are updated; omitted fields are preserved.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.triggers.update(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        request: [
            PatchPointsTriggersRequestItem(
                id: "id"
            )
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `PatchPointsTriggersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.triggers.<a href="/Sources/Resources/Admin/Points/Triggers/TriggersClient.swift">get</a>(systemId: String, id: String, requestOptions: RequestOptions?) -> AdminPointsTrigger</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single points trigger by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.points.triggers.get(
        systemId: "550e8400-e29b-41d4-a716-446655440000",
        id: "660f9500-f30c-42e5-b827-557766550001"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**systemId:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The UUID of the points trigger.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Streaks Freezes
<details><summary><code>client.admin.streaks.freezes.<a href="/Sources/Resources/Admin/Streaks/Freezes/FreezesClient.swift">create</a>(request: Requests.CreateStreakFreezesRequest, requestOptions: RequestOptions?) -> CreateStreakFreezesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create streak freezes for multiple users.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.streaks.freezes.create(request: .init(freezes: [
        CreateStreakFreezesRequestFreezesItem(
            userId: "user-123"
        ),
        CreateStreakFreezesRequestFreezesItem(
            userId: "user-456"
        ),
        CreateStreakFreezesRequestFreezesItem(
            userId: "user-123"
        )
    ]))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateStreakFreezesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Streaks Pauses
<details><summary><code>client.admin.streaks.pauses.<a href="/Sources/Resources/Admin/Streaks/Pauses/PausesClient.swift">create</a>(request: Requests.CreateStreakPausesRequest, requestOptions: RequestOptions?) -> CreateStreakPausesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create streak pauses for multiple users. A pause covers a specific date range and maintains the user's streak length during that range instead of ending the streak. Start dates in the past are rejected.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.streaks.pauses.create(request: .init(pauses: [
        CreateStreakPausesRequestPausesItem(
            userId: "user-123",
            start: "2026-08-20",
            end: "2026-08-27"
        ),
        CreateStreakPausesRequestPausesItem(
            userId: "user-456",
            start: "2026-09-01",
            end: "2026-09-07"
        )
    ]))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateStreakPausesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.streaks.pauses.<a href="/Sources/Resources/Admin/Streaks/Pauses/PausesClient.swift">delete</a>(ids: [String]?, requestOptions: RequestOptions?) -> DeleteStreakPausesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete streak pauses by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.streaks.pauses.delete(ids: [
        "550e8400-e29b-41d4-a716-446655440000",
        "550e8400-e29b-41d4-a716-446655440001"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[String]?` — Streak pause IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Streaks Settings
<details><summary><code>client.admin.streaks.settings.<a href="/Sources/Resources/Admin/Streaks/Settings/StreaksSettingsClient.swift">get</a>(requestOptions: RequestOptions?) -> StreakSettings</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get the organization's streak configuration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.streaks.settings.get()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.streaks.settings.<a href="/Sources/Resources/Admin/Streaks/Settings/StreaksSettingsClient.swift">update</a>(request: Requests.UpdateStreakSettingsRequest, requestOptions: RequestOptions?) -> StreakSettings</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the organization's streak configuration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Trophy

private func main() async throws {
    let client = TrophyApiClient(
        apiKey: "<value>",
        sdkVersion: "<X-SDK-VERSION>"
    )

    _ = try await client.admin.streaks.settings.update(request: .init(
        frequency: .daily,
        evaluationMode: .or,
        customizationEnabled: true,
        daysOff: [
            0,
            6
        ],
        metrics: [
            StreakSettingsMetric(
                key: "words-written",
                threshold: 500
            )
        ],
        freezes: UpdateStreakSettingsFreezes(
            startCount: 1,
            maxCount: 2,
            autoEarnInterval: 7,
            autoEarnAmount: 1
        )
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.UpdateStreakSettingsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

