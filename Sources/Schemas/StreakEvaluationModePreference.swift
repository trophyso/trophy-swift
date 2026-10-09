import Foundation

/// Whether meeting any single metric threshold (`OR`) or all configured metric thresholds (`AND`) extends the user's streak. Matches the evaluation mode configured in dashboard streak settings.
public enum StreakEvaluationModePreference: String, Codable, Hashable, CaseIterable, Sendable {
    case or = "OR"
    case and = "AND"
}