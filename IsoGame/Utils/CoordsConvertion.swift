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
