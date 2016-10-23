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
