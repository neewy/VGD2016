import SpriteKit

class GameScene: SKScene {
    
    //1
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Hero object in 2D and ISOMETRIC
    let enemy = Enemy()
    
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
        
        let deviceScale = self.size.width/1000
        
        map2D.view.position = CGPoint(x:-self.size.width*0.4, y:self.size.height*0.4)
        map2D.view.xScale = deviceScale / 3
        map2D.view.yScale = deviceScale / 3
        map2D.view.zPosition = 100;
        addChild(map2D.view)
        
        mapISO.view.position = CGPoint(x:0, y:self.size.height*0.2)
        mapISO.view.xScale = deviceScale
        mapISO.view.yScale = deviceScale
        mapISO.view.addChild(mapISO.layerIsoGround)
        mapISO.view.addChild(mapISO.layerIsoObjects)
        mapISO.view.zPosition = 1;
        addChild(mapISO.view)
        
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
        positions.append(CGPoint(x:34.34765625, y:-189.62109375))
        positions.append(CGPoint(x:34.34765625, y:-189.62109375))
        positions.append(CGPoint(x:222.265640258789, y:-225.195327758789))
        
        enemy.goThroughPath(path: positions)
        
        // Перемещаем 2D узел
        //enemy.goTo(position: touchPosition2D)
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
