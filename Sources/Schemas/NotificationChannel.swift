import Foundation

/// A notification delivery channel.
public enum NotificationChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case email
    case push
}