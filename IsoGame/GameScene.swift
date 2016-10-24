import SpriteKit

class GameScene: SKScene {
    
    //1
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Hero object in 2D and ISOMETRIC
    let enemy = Enemy()
    
    //Camera
    let cameraNode = SKCameraNode()
    
    // Карта
    let map2D: Map2D
    let mapISO: MapISO
    
    let nthFrame = 6
    var nthFrameCount = 0
    
    //4
    override init(size: CGSize) {
        map2D = Map2D(enemy: enemy)
        mapISO = MapISO(enemy: enemy)
        
        super.init(size: size)
        self.anchorPoint = CGPoint(x:0.5, y:0.5)
    }
    
    //5
    override func didMove(to view: SKView) {
        
        let deviceScale = self.size.width/667
        
        
        mapISO.view.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        mapISO.view.xScale = deviceScale
        mapISO.view.yScale = deviceScale
        mapISO.view.addChild(mapISO.layerIsoGround)
        mapISO.view.addChild(mapISO.layerIsoObjects)
        mapISO.view.zPosition = 1;
        addChild(mapISO.view)
        
        //Camera
        cameraNode.zPosition = CGFloat(UInt32.max)
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position.x = size.width / 2
        cameraNode.position.y = size.height / 2
        
        map2D.view.position = CGPoint(x:-self.size.width*0.5, y:self.size.height*0.4)
        map2D.view.xScale = deviceScale / 4
        map2D.view.yScale = deviceScale / 4
        map2D.view.zPosition = cameraNode.zPosition
        map2D.view.alpha = 0.80
        cameraNode.addChild(map2D.view)
        
        mapISO.placeAllTilesISO()
        map2D.placeAllTiles2D()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Понимаем где у нас коснулись в изометрии
        let touch = touches.first
        let touchPositionISO = touch!.location(in: mapISO.view)
        
        // Преобразуем изометрию в 2D
        var touchPosition2D = pointIsoTo2D(touchPositionISO)
        
        print(touchPosition2D)

        var positions = [CGPoint]()
        positions.append(CGPoint(x:30.8593826293945, y:-197.851570129395))
        positions.append(CGPoint(x:507.91015625, y:-230.56640625))
        self.enemy.goThroughPath(path: positions)
        
        // Перемещаем 2D узел
        //enemy.goTo(position: touchPosition2D)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let previousLocation = touch.previousLocation(in: self)

            let deltaX = location.x - previousLocation.x
            let deltaY = location.y - previousLocation.y
            cameraNode.position.x -= deltaX
            cameraNode.position.y -= deltaY
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        enemy.tileSpriteISO.position = point2DToIso(enemy.tileSprite2D.position)
        
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
