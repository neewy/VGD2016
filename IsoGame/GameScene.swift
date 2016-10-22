import SpriteKit

class GameScene: SKScene {
    
    //1
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let hero = Droid()
    let map: Map
    
    let nthFrame = 6
    var nthFrameCount = 0
    
    //4
    override init(size: CGSize) {
        map = Map(hero: hero)
        
        super.init(size: size)
        self.anchorPoint = CGPoint(x:0.5, y:0.5)
    }
    
    //5
    override func didMove(to view: SKView) {
        
        let deviceScale = self.size.width/667
        
        map.view2D.position = CGPoint(x:-self.size.width*0.45, y:self.size.height*0.17)
        map.view2D.xScale = deviceScale
        map.view2D.yScale = deviceScale
        addChild(map.view2D)
        
        map.viewIso.position = CGPoint(x:self.size.width*0.12, y:self.size.height*0.12)
        map.viewIso.xScale = deviceScale
        map.viewIso.yScale = deviceScale
        map.viewIso.addChild(map.layerIsoGround)
        map.viewIso.addChild(map.layerIsoObjects)
        addChild(map.viewIso)
        
        map.placeAllTiles2D()
        map.placeAllTilesIso()
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
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //1
        let touch = touches.first
        let touchLocation = touch!.location(in: map.viewIso)
        //2
        var touchPos2D = map.pointIsoTo2D(touchLocation)
        //3
        touchPos2D = touchPos2D + CGPoint(x: map.tileSize.width/2, y: -map.tileSize.height/2)
        //4
        let heroPos2D = touchPos2D + CGPoint(x: -map.tileSize.width/2, y: -map.tileSize.height/2)
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
        
        hero.tileSpriteIso.position = map.point2DToIso(hero.tileSprite2D.position)
        
        nthFrameCount += 1
        if (nthFrameCount == nthFrame) {
            nthFrameCount = 0
            updateOnNthFrame()
        }
    }
    
    func updateOnNthFrame() {
        map.sortDepth()
    }
}
