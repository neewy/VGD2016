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


enum Direction: Int {
    
    case n,ne,e,se,s,sw,w,nw
    
    var description:String {
        switch self {
        case .n:return "North"
        case .ne:return "North East"
        case .e:return "East"
        case .se:return "South East"
        case .s:return "South"
        case .sw:return "South West"
        case .w:return "West"
        case .nw:return "North West"
        }
    }
}

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

enum Action: Int {
    case idle, move
    
    var description:String {
        switch self {
        case .idle:return "Idle"
        case .move:return "Move"
        }
    }
}


class GameScene: SKScene {
    
    //1
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //2
    let view2D:SKSpriteNode
    let viewIso:SKSpriteNode
    let layerIsoGround:SKNode
    let layerIsoObjects:SKNode
    
    //3
    let tiles = [
        [(1,7), (1,0), (1,0), (1,0), (1,0), (1,1)],
        [(1,6), (0,0), (0,0), (0,0), (0,0), (1,2)],
        [(1,6), (0,0), (2,2), (0,0), (0,0), (1,2)],
        [(1,6), (0,0), (0,0), (0,0), (0,0), (1,2)],
        [(1,6), (0,0), (0,0), (0,0), (0,0), (1,2)],
        [(1,5), (1,4), (1,4), (1,4), (1,4), (1,3)]
    ]
    
    
    let tileSize = (width:32, height:32)
    
    let hero = Droid()
    
    let nthFrame = 6
    var nthFrameCount = 0
    
    //4
    override init(size: CGSize) {
        
        view2D = SKSpriteNode()
        viewIso = SKSpriteNode()
        layerIsoGround = SKNode()
        layerIsoObjects = SKNode()
        
        super.init(size: size)
        self.anchorPoint = CGPoint(x:0.5, y:0.5)
    }
    
    //5
    override func didMove(to view: SKView) {
        
        let deviceScale = self.size.width/667
        
        view2D.position = CGPoint(x:-self.size.width*0.45, y:self.size.height*0.17)
        view2D.xScale = deviceScale
        view2D.yScale = deviceScale
        addChild(view2D)
        
        viewIso.position = CGPoint(x:self.size.width*0.12, y:self.size.height*0.12)
        viewIso.xScale = deviceScale
        viewIso.yScale = deviceScale
        viewIso.addChild(layerIsoGround)
        viewIso.addChild(layerIsoObjects)
        addChild(viewIso)
        
        placeAllTiles2D()
        placeAllTilesIso()
    }
    
    func placeTile2D(_ tile:Tile, direction:Direction, position:CGPoint) {
        
        let tileSprite = SKSpriteNode(imageNamed: textureImage(tile, direction: direction, action: Action.idle))
        
        if (tile == hero.tile) {
            hero.tileSprite2D = tileSprite
            hero.tileSprite2D.zPosition = 1
        }
        
        tileSprite.position = position
        
        tileSprite.anchorPoint = CGPoint(x:0, y:0)
        
        view2D.addChild(tileSprite)
        
    }
    
    func placeAllTiles2D() {
        
        for i in 0..<tiles.count {
            
            let row = tiles[i];
            
            for j in 0..<row.count {
                
                let tile = Tile(rawValue: row[j].0)!
                let direction = Direction(rawValue: row[j].1)!
                
                let point = CGPoint(x: (j*tileSize.width), y: -(i*tileSize.height))
                
                if (tile == Tile.droid) {
                    placeTile2D(Tile.ground, direction:direction, position:point)
                }
                
                placeTile2D(tile, direction:direction, position:point)
            }
            
        }       
    }
    
    func placeTileIso(_ tile:Tile, direction:Direction, position:CGPoint) {
        
        let tileSprite = SKSpriteNode(imageNamed: "iso_3d_"+textureImage(tile, direction: direction, action: Action.idle))
        
        if (tile == hero.tile) {
            hero.tileSpriteIso = tileSprite
        }
        
        tileSprite.position = position
        
        tileSprite.anchorPoint = CGPoint(x:0, y:0)
        
        if (tile == Tile.ground) {
            layerIsoGround.addChild(tileSprite)
        } else if (tile == Tile.wall || tile == Tile.droid) {
            layerIsoObjects.addChild(tileSprite)
        }
        
    }
    func placeAllTilesIso() {
        
        for i in 0..<tiles.count {
            
            let row = tiles[i];
            
            for j in 0..<row.count {
                
                let tile = Tile(rawValue: row[j].0)!
                let direction = Direction(rawValue: row[j].1)!
                
                let point = point2DToIso(CGPoint(x: (j*tileSize.width), y: -(i*tileSize.height)))
                
                if (tile == Tile.droid) {
                    placeTileIso(Tile.ground, direction:direction, position:point)
                }
                
                placeTileIso(tile, direction:direction, position:point)
                
            }
        }
    }
    
    
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
    
    
    func sortDepth() {
        
        //1
        let childrenSortedForDepth = layerIsoObjects.children.sorted() {
            
            let p0 = self.pointIsoTo2D($0.position)
            let p1 = self.pointIsoTo2D($1.position)
            
            if ((p0.x+(-p0.y)) > (p1.x+(-p1.y))) {
                return false
            } else {
                return true
            }
            
        }
        //2
        for i in 0..<childrenSortedForDepth.count {
            
            let node = childrenSortedForDepth[i]
            
            node.zPosition = CGFloat(i)
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //1
        let touch = touches.first
        let touchLocation = touch!.location(in: viewIso)
        //2
        var touchPos2D = pointIsoTo2D(touchLocation)
        //3
        touchPos2D = touchPos2D + CGPoint(x:tileSize.width/2, y:-tileSize.height/2)
        //4
        let heroPos2D = touchPos2D + CGPoint(x:-tileSize.width/2, y:-tileSize.height/2)
        //5
        
        //1
        let deltaY = heroPos2D.y - hero.tileSprite2D.position.y
        let deltaX = heroPos2D.x - hero.tileSprite2D.position.x
        //2
        let degrees = atan2(deltaX, deltaY) * (180.0 / CGFloat(M_PI))
        //3
        hero.facing = degreesToDirection(degrees)
        //4
        hero.update()
        
        let velocity = 100
        let time = TimeInterval(distance(heroPos2D, p2: hero.tileSprite2D.position)/CGFloat(velocity))
        hero.tileSprite2D.removeAllActions()
        hero.tileSprite2D.run(SKAction.move(to: heroPos2D, duration: time))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        hero.tileSpriteIso.position = point2DToIso(hero.tileSprite2D.position)
        
        nthFrameCount += 1
        if (nthFrameCount == nthFrame) {
            nthFrameCount = 0
            updateOnNthFrame()
        }
    }
    
    func updateOnNthFrame() {
        sortDepth()
    }
}
