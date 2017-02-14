package starling
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.Shape;
    import flash.display.Stage;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    
    import starling.display.Image;
	import starling.display.Mesh;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.rendering.VertexData;
	import starling.text.TextField;
    import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.deg2rad;
    
    public class Game extends Sprite
    {
        private var fStage:Stage;
        private var gen:Sprite;
        private var shape:Shape = new Shape();
		
		[Embed(source="../../atf/meteor.png")]
		private var textureAtfFile:Class;
	
		[Embed(source="../../atf/effect_areas_asteroids.xml", mimeType="application/octet-stream")]
		public static const AtlasXml:Class;
	
		[Embed(source="../../atf/effect_areas_asteroids.png")]
		public static const AtlasTexture:Class;
	
		private var im:Image;
        
        public function Game()
        {
			
			var q = new Quad(256,256,0x007777);
			addChild(q);
			
			var bgTexture:Texture = Texture.fromEmbeddedAsset(textureAtfFile);
			//var subTexture:Texture = Texture.fromTexture(
			//		bgTexture, new Rectangle(10, 10, 170, 150));
			im = new Image(bgTexture);
			addChild(im);
			
			doAdjustments(q);
			doAdjustments(im);
	
			var texture:Texture = Texture.fromEmbeddedAsset(AtlasTexture);
			var xml:XML = XML(new AtlasXml());
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
	
			var moonTexture:Texture = atlas.getTexture("Meteor_1_0000.png");
			var moonImage:Image = new Image(moonTexture);
			addChild(moonImage);
			
//			var mc:MovieClip = new MovieClip(new )
			
            fStage = Startup.flashStage;
            var textField:TextField = new TextField(400, 300, "Welcome to Starling!");
            addChild(textField);
            
            drawLine(0,200,1000,200,0);
            drawLine(0,400,1000,400,0);
            drawLine(200,200,200,800,0);
            drawLine(400,200,400,800,0);
    
            var flBox:Shape = new Shape();
            flBox.x = flBox.y = 200;
            flBox.graphics.beginFill(0xff00ff, 1);
            flBox.graphics.drawRect(-10,-10,20,20);
            flBox.graphics.endFill();
    
            fStage.addChild(flBox)
            var stBox = flashSpriteToStarling(flBox);
            stBox.x = 400;
            stBox.y = 200;
            addChild(stBox);
    
            shape.graphics.beginFill(0xff0000);
            shape.graphics.drawCircle( 500, 500, 50);
            shape.graphics.endFill();
    
            var b3 = shape.getBounds(fStage);
            //shape.x = shape.y = 75;
            fStage.addChild(shape);
            
            //default way - CUT
            var bm:BitmapData = new BitmapData(fStage.stageWidth, fStage.stageHeight, true, 0x00000000);
            var bb:Bitmap = new Bitmap(bm);
            bb.x = 500;
            fStage.addChild(bb);
            bm.draw(shape, shape.transform.matrix); //that's nice
    
            gen = flashSpriteToStarling(shape);
            addChild(gen);
            fStage.addEventListener(MouseEvent.CLICK, onClick)
        }
		
		private function doAdjustments(d:starling.display.DisplayObject):void{
			d.x = d.y = 200;
			d.alignPivot();
			//d.rotation = deg2rad(45);
		}
    
        private function onClick(event:MouseEvent):void
        {

            if(event.ctrlKey){
                shape.rotation += 30;
                gen.rotation += deg2rad(30);
            }else{
                shape.x += 50;
                gen.x += 100;
            }
        }
    
        private function flashSpriteToStarling(sprite:flash.display.DisplayObject):starling.display.Sprite{
            
            var rect:Rectangle = sprite.getRect(fStage);
            sprite.x -= rect.x;
            sprite.y -= rect.y;
            
            var bitmapData:BitmapData = new BitmapData(sprite.width, sprite.height, true, 0x00000000);
            bitmapData.draw(sprite,sprite.transform.matrix);
            
            //draw
//            var bmp:Bitmap = new Bitmap (bitmapData);
//            bmp.x = 200 - sprite.x;
//            bmp.y = 400 - sprite.y;
//            fStage.addChild(bmp)
            
            var texture:Texture = Texture.fromBitmapData(bitmapData, false, false);
            var im:Image = new Image(texture);
            var starlingSprite:starling.display.Sprite = new starling.display.Sprite();
            starlingSprite.addChild(im);
            starlingSprite.x = sprite.x += rect.x;
            starlingSprite.y = sprite.y += rect.y;
            im.x = - rect.width/2;
            im.y = - rect.height/2;
            return starlingSprite;
        }
    
        private function drawLine(x1:Number, y1:Number, x2:Number, y2:Number, angle:Number):void
        {
            var line:Shape = new Shape();
            line.graphics.lineStyle(2, 0x990000, .75);
            line.graphics.beginFill(0x00FF00);
            var dx:Number = x2 - x1;
            var dy:Number = y2 - y1;
            var centerX:Number = (x1 + x2)/2;
            var centerY:Number = (y1 + y2)/2;
            line.graphics.moveTo(-dx/2, -dy/2);
            line.graphics.lineTo(dx/2, dy/2);
            line.x = centerX;
            line.y = centerY;
            line.rotation = angle;
            //addChild(flashSpriteToStarling(line));
            fStage.addChild(line);
        }
    }
}