import SpriteKit

class MapISO {
    //2
    let view:SKSpriteNode
    let layerIsoGround:SKNode
    let layerIsoObjects:SKNode
    
    let tileSize = TILE_SIZE
    
    init() {
        view = SKSpriteNode()
        layerIsoGround = SKNode()
        layerIsoObjects = SKNode()
    }
    
    func placeObject(_ objectToPlace:GameObject, onPosition:CGPoint) {

        objectToPlace.tileSpriteISO.position = onPosition
        
        objectToPlace.tileSpriteISO.anchorPoint = CGPoint(x:0, y:0)
        
        if (objectToPlace.tile == Tile.wall || objectToPlace.tile == Tile.droid) {
            layerIsoObjects.addChild(objectToPlace.tileSpriteISO)
        }
    }
    
    func placeTileISO(_ tile:Tile, direction:Direction, position:CGPoint) {
        
        let tileSprite = SKSpriteNode(imageNamed: "iso_3d_"+textureImage(tile, direction: direction, action: Action.idle))
        
        tileSprite.position = position
        
        tileSprite.anchorPoint = CGPoint(x:0, y:0)
        
        if (tile == Tile.road) {
            tileSprite.color = .brown
            tileSprite.colorBlendFactor = 0.45;
            layerIsoGround.addChild(tileSprite)
        }
        if (tile == Tile.ground) {
            layerIsoGround.addChild(tileSprite)
        } else if (tile == Tile.wall || tile == Tile.droid) {
            layerIsoObjects.addChild(tileSprite)
        }
        
    }
    
    func placeAllTilesISO() {
        
        for i in 0..<tiles.count {
            
            let row = tiles[i];
            
            for j in 0..<row.count {
                
                let tile = Tile(rawValue: row[j].0)!
                let direction = Direction(rawValue: row[j].1)!
                
                let point = point2DToIso(CGPoint(x: (j*tileSize.width), y: -(i*tileSize.height)))
                
                if (tile == Tile.droid) {
                    placeTileISO(Tile.road, direction:direction, position:point)
                }
                
                placeTileISO(tile, direction:direction, position:point)
                
            }
        }
    }
    
    func sortDepth() {
        
        //1
        let childrenSortedForDepth = layerIsoObjects.children.sorted() {
            
            let p0 = pointIsoTo2D($0.position)
            let p1 = pointIsoTo2D($1.position)
            
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

}
