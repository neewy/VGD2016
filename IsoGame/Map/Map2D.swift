import SpriteKit


class Map2D {
    //2
    let view:SKSpriteNode
    
    init() {
        view = SKSpriteNode()
    }
    
    func placeObject(_ objectToPlace:GameObject, onPosition:CGPoint) {
        
        objectToPlace.tileSprite2D.position = onPosition
        
        objectToPlace.tileSprite2D.anchorPoint = CGPoint(x:0, y:0)
 
        view.addChild(objectToPlace.tileSprite2D)

    }
    
    func placeTile2D(_ tile:Tile, direction:Direction, position:CGPoint) {
        
        let tileSprite = SKSpriteNode(imageNamed: textureImage(tile, direction: direction, action: Action.idle))
        
        if (tile == Tile.road) {
            tileSprite.color = .brown
            tileSprite.colorBlendFactor = 0.45;
        }
        
        tileSprite.position = position
        
        tileSprite.anchorPoint = CGPoint(x:0, y:0)
        
        view.addChild(tileSprite)
        
    }
    
    func placeAllTiles2D() {
        
        for i in 0..<tiles.count {
            
            let row = tiles[i];
            
            for j in 0..<row.count {
                
                let tile = Tile(rawValue: row[j].0)!
                let direction = Direction(rawValue: row[j].1)!
                
                let point = CGPoint(x: (j*TILE_SIZE.width), y: -(i*TILE_SIZE.height))
                
                if (tile == Tile.droid) {
                    placeTile2D(Tile.road, direction:direction, position:point)
                }
                
                placeTile2D(tile, direction:direction, position:point)
            }
            
        }
    }
    
}
