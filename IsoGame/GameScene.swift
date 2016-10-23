import SpriteKit

class GameScene: SKScene {
    
    //1
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Hero object in 2D and ISOMETRIC
    let hero2D = Droid2D()
    let heroISO = DroidISO()

    // Zombie object in 2D and ISOMETRIC
    let enemy2D = Enemy2D()
    let enemyISO = EnemyISO()
    
    let map2D: Map2D
    let mapISO: MapISO
    
    let nthFrame = 6
    var nthFrameCount = 0
    
    //4
    override init(size: CGSize) {
        map2D = Map2D(hero: hero2D)
        mapISO = MapISO(hero: heroISO)

        super.init(size: size)
        self.anchorPoint = CGPoint(x:0.5, y:0.5)
    }
    
    //5
    override func didMove(to view: SKView) {
        
        let deviceScale = self.size.width/667
        
        map2D.view.position = CGPoint(x:-self.size.width*0.5, y:self.size.height*0.4)
        map2D.view.xScale = deviceScale / 2
        map2D.view.yScale = deviceScale / 2
        addChild(map2D.view)
        
        mapISO.view.position = CGPoint(x:self.size.width*0.05, y:self.size.height*0.05)
        mapISO.view.xScale = deviceScale
        mapISO.view.yScale = deviceScale
        mapISO.view.addChild(mapISO.layerIsoGround)
        mapISO.view.addChild(mapISO.layerIsoObjects)
        addChild(mapISO.view)
        
        map2D.placeAllTiles2D()
        mapISO.placeAllTilesIso()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //1
        let touch = touches.first
        let touchLocation = touch!.location(in: mapISO.view)
        
        //2
        var touchPos2D = pointIsoTo2D(touchLocation)
        
        //3
        touchPos2D = touchPos2D + CGPoint(x: map2D.tileSize.width/2, y: -map2D.tileSize.height/2)
        
        //4
        let heroPos2D = touchPos2D + CGPoint(x: -map2D.tileSize.width/2, y: -map2D.tileSize.height/2)
        //5
        
        //1
        let deltaY = heroPos2D.y - hero2D.tileSprite2D.position.y
        let deltaX = heroPos2D.x - hero2D.tileSprite2D.position.x
        //2
        let degrees = atan2(deltaX, deltaY) * (180.0 / CGFloat(M_PI))
        //3
        hero2D.facing = degreesToDirection(degrees)
        hero2D.facing = degreesToDirection(degrees)
        heroISO.facing = degreesToDirection(degrees)
        heroISO.facing = degreesToDirection(degrees)
        //4
        hero2D.update()
        heroISO.update()
        
        let velocity = 100
        let time = TimeInterval(distance(heroPos2D, p2: hero2D.tileSprite2D.position)/CGFloat(velocity))
        hero2D.tileSprite2D.removeAllActions()
        hero2D.tileSprite2D.run(SKAction.move(to: heroPos2D, duration: time))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        heroISO.tileSpriteIso.position = point2DToIso(hero2D.tileSprite2D.position)
        
        nthFrameCount += 1
        if (nthFrameCount == nthFrame) {
            nthFrameCount = 0
            updateOnNthFrame()
        }
    }
    
    func updateOnNthFrame() {
        mapISO.sortDepth()
    }
}
