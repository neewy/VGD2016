import SpriteKit

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGPoint) -> CGPoint {
    return CGPoint(x: point.x * scalar.x, y: point.y * scalar.y)
}

func / (point: CGPoint, scalar: CGPoint) -> CGPoint {
    return CGPoint(x: point.x / scalar.x, y: point.y / scalar.y)
}

func distance(_ p1:CGPoint, p2:CGPoint) -> CGFloat {
    return CGFloat(hypotf(Float(p1.x) - Float(p2.x), Float(p1.y) - Float(p2.y)))
}

func round(_ point:CGPoint) -> CGPoint {
    return CGPoint(x: round(point.x), y: round(point.y))
}

func floor(_ point:CGPoint) -> CGPoint {
    return CGPoint(x: floor(point.x), y: floor(point.y))
}

func ceil(_ point:CGPoint) -> CGPoint {
    return CGPoint(x: ceil(point.x), y: ceil(point.y))
}
