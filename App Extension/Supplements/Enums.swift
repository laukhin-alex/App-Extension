import Foundation

enum TabIdentifier: Hashable {
    case newText
    case resultView
    case history
}

enum SegmentIdentifier: Int, Hashable {
    case allValues = 0
    case only3
    case topValues
}
