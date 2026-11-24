import Foundation

/// `completed` when `completedAt` is set. Otherwise, once `dueAt` has passed, `missed` for a goal with `completion: manual` or `metric` and `ended` for one with `completion: none`. Otherwise `active`.
public enum GoalStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case completed
    case missed
    case ended
}