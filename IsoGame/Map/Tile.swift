enum Tile: Int {
    
    case ground, wall, droid
    
    var description:String {
        switch self {
        case .ground:return "Ground"
        case .wall:return "Wall"
        case .droid:return "Droid"
        }
    }
}
