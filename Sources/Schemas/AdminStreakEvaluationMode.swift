import Foundation

/// Whether meeting any single metric threshold (`OR`) or all configured metric thresholds (`AND`) extends the user's streak.
public enum AdminStreakEvaluationMode: String, Codable, Hashable, CaseIterable, Sendable {
    case or = "OR"
    case and = "AND"
}