import Foundation

/// The email brand font. Configured on the email settings form in the dashboard.
public enum AdminFontFamily: String, Codable, Hashable, CaseIterable, Sendable {
    case modernSans = "MODERN_SANS"
    case bookSans = "BOOK_SANS"
    case organicSans = "ORGANIC_SANS"
    case geometricSans = "GEOMETRIC_SANS"
    case heavySans = "HEAVY_SANS"
    case roundedSans = "ROUNDED_SANS"
    case modernSerif = "MODERN_SERIF"
    case bookSerif = "BOOK_SERIF"
    case monospace = "MONOSPACE"
}