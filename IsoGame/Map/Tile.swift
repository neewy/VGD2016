enum Tile: Int {
    case ground
    case wall
    case droid
    case road

    var description: String {
        switch self {
        case .ground:return "Ground"
        case .wall:return "Wall"
        case .droid:return "Droid"
        case .road:return "Road"
        default: return ""
        }
    }
}
