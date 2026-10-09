import Foundation

public final class AdminPointsClient: Sendable {
    public let systems: SystemsClient
    public let boosts: BoostsClient
    public let levels: LevelsClient
    public let triggers: TriggersClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.systems = SystemsClient(config: config)
        self.boosts = BoostsClient(config: config)
        self.levels = LevelsClient(config: config)
        self.triggers = TriggersClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }
}