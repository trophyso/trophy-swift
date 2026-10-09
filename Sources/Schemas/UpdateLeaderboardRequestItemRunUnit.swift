import Foundation

public enum UpdateLeaderboardRequestItemRunUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case day
    case month
    case year
}