import UIKit

func point2DToIso(_ p:CGPoint) -> CGPoint {
    
    //invert y pre conversion
    var point = p * CGPoint(x:1, y:-1)
    
    //convert using algorithm
    point = CGPoint(x:(point.x - point.y), y: ((point.x + point.y) / 2))
    
    //invert y post conversion
    point = point * CGPoint(x:1, y:-1)
    
    return point
}


func pointIsoTo2D(_ p:CGPoint) -> CGPoint {
    
    //invert y pre conversion
    var point = p * CGPoint(x:1, y:-1)
    
    //convert using algorithm
    point = CGPoint(x:((2 * point.y + point.x) / 2), y: ((2 * point.y - point.x) / 2))
    
    //invert y post conversion
    point = point * CGPoint(x:1, y:-1)
    
    return point
}


func degreesToDirection(_ pdegrees:CGFloat) -> Direction {
    var degrees = pdegrees
    
    if (degrees < 0) {
        degrees = degrees + 360
    }
    let directionRange = 45.0
    
    degrees = degrees + CGFloat(directionRange/2)
    
    var direction = Int(floor(Double(degrees)/directionRange))
    
    if (direction == 8) {
        direction = 0
    }
    
    return Direction(rawValue: direction)!
}

func point2DToPointTileIndex(point:CGPoint) -> CGPoint {
    
    return floor(point / CGPoint(x: TILE_SIZE.width, y: TILE_SIZE.height))
    
}

func pointTileIndexToPoint2D(point:CGPoint) -> CGPoint {
    
    return point * CGPoint(x: TILE_SIZE.width, y: TILE_SIZE.height)
    
}


func traversableTiles() -> [[Int]] {
    
    //1
    var tTiles = [[Int]]()
    
    //2
    func binarize(num:Int) ->Int {
        if (num == 0 || num == 1) {
            return Global.tilePath.nonTraversable
        } else {
            return Global.tilePath.traversable
        }
    }
    
    //3
    for i in 0..<tiles.count {
        let tt = tiles[i].map{i in binarize(num: i.0)}
        tTiles.append(tt)
    }
    
    return tTiles
}

func findPathFrom(from:CGPoint, to:CGPoint) -> [CGPoint]? {
    
    let traversable = traversableTiles()
    
    //1
    if (Int(to.x) > 0)
        && (Int(to.x) < traversable.count)
        && (Int(-to.y) > 0)
        && (Int(-to.y) < traversable.count)
    {
        
        //2
        if (traversable[Int(-to.y)][Int(to.x)] == Global.tilePath.traversable ) {
            
            //3
            let pathFinder = PathFinder(xIni: Int(from.x), yIni: Int(from.y), xFin: Int(to.x), yFin: Int(to.y), lvlData: traversable)
            let myPath = pathFinder.findPath()
            return myPath
            
        } else {
            
            return nil
        }
        
    } else {
        
        return nil
    }
    
}
