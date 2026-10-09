# Trophy Swift SDK

The Trophy Swift SDK provides convenient access to the Trophy API from applications written in
Swift.

Trophy provides APIs and tools for adding gamification to your application, keeping users engaged
through rewards, achievements, streaks, and personalized communication.

## Installation

Add the package to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/trophyso/trophy-swift", from: "1.0.0"),
]
```

Then add the `Trophy` product to your target:

```swift
.product(name: "Trophy", package: "trophy-swift"),
```

In Xcode, use File → Add Package Dependencies and enter
`https://github.com/trophyso/trophy-swift`.

## Usage

The package needs to be configured with your account's API key, which is available in the Trophy
dashboard.

The client defaults to the application API at `https://api.trophy.so/v1`. Admin endpoints
use `https://admin.trophy.so/v1`, passed as `baseURL`.

```swift
import Trophy

let client = TrophyApiClient(
    apiKey: "YOUR_API_KEY",
    sdkVersion: "1.26.0"
)

let response = try await client.metrics.event(
    key: "words-written",
    request: .init(
        user: .init(
            id: "18",
            email: "jk.rowling@harrypotter.com",
            tz: "Europe/London"
        ),
        value: 750.0
    )
)
```

## Documentation

See the [Trophy API Docs](https://docs.trophy.so) for more
information on the accessible endpoints.

## License

This library is distributed under the MIT license found in the [LICENSE](./LICENSE) file.
