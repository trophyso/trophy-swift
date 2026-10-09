import Foundation

/// The type of trigger.
public enum AdminPointsTriggerType: String, Codable, Hashable, CaseIterable, Sendable {
    case metric
    case achievement
    case streak
    case time
    case userCreation = "user_creation"
}