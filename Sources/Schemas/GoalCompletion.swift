import Foundation

/// How a goal is completed. `manual`: you mark it completed, for something the user finishes, like an essay. `none`: never completed, for a date the user works towards, like an exam. `metric`: completed when a metric's total since `start` reaches `target`, like 50 lessons.
public enum GoalCompletion: String, Codable, Hashable, CaseIterable, Sendable {
    case manual
    case none
    case metric
}