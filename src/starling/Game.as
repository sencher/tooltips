package starling
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.Shape;
    import flash.display.Stage;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.text.TextField;
    import starling.textures.Texture;
    
    public class Game extends Sprite
    {
        private var fStage:Stage;
        public function Game()
        {
            fStage = Startup.flashStage;
            var textField:TextField = new TextField(400, 300, "Welcome to Starling!");
            addChild(textField);
            
            drawLine(0,200,1000,200,0);
            drawLine(0,400,1000,400,0);
            drawLine(200,200,200,800,0);
            drawLine(400,200,400,800,0);
    
            var nBox:Shape = new Shape();
            nBox.x = nBox.y = 200;
            nBox.graphics.beginFill(0xff00ff, 1);
            nBox.graphics.drawRect(-10,-10,20,20);
            nBox.graphics.endFill();
    
            fStage.addChild(nBox)
            
            var b1 = nBox.getBounds(fStage);
            var b2 = nBox.getRect(fStage);

//        var s = RunAnt.flashStage;
//        s.addChild(line);
    
            var im:Image = flashSpriteToImage(nBox, b1);
            im.x = 400 - nBox.x;
            im.y = 200 - nBox.y;
            addChild(im);
            //_gameObject.addToLayer(im, EntityDisplayStarling.TOP_LAYER);
    
            var s:Shape = new Shape();
            s.graphics.beginFill(0xff0000);
            s.graphics.drawCircle( 0, 0, 50);
            s.graphics.endFill();
    
            s.x = s.y = 75;
            //fStage.addChild(s);
            //addChild(s);
    
            var bm:BitmapData = new BitmapData(fStage.stageWidth, fStage.stageHeight, true, 0x00000000);
//            var bm:BitmapData = new BitmapData(s.width, s.height, true, 0x00000000);
            var bb:Bitmap = new Bitmap(bm);
            bb.x = 500;
            //fStage.addChild(bb);
    
            //bm.draw(s); //doesn't work too well
            bm.draw(s, s.transform.matrix); //that's nice
            
        }
    
        private function flashSpriteToImage(sprite:DisplayObject, box:Rectangle):Image{
            var bitmapData:BitmapData = new BitmapData(sprite.stage.stageWidth, sprite.stage.stageHeight, true, 0x00000000);
            bitmapData.draw(sprite,sprite.transform.matrix);
            
//            var bm2:BitmapData = new BitmapData(sprite.stage.stageWidth, sprite.stage.stageHeight, true, 0x00000000);
//            bitmapData.copyPixels(bm2, sprite.stage.getBounds(fStage), new Point(0,0));
//            bitmapData.copyPixels(bm2, new flash.geom.Rectangle(0,0,500,500), new Point(0,0));
            
//            var bmp2:Bitmap = new Bitmap(bm2);
//            bmp2.x = 400;
//            bmp2.y = 400;
//            fStage.addChild(bmp2);
            
            var bmp:Bitmap = new Bitmap (bitmapData);
            bmp.x = 200 - sprite.x;
            bmp.y = 400 - sprite.y;
            fStage.addChild(bmp)
            var texture:Texture = Texture.fromBitmapData(bitmapData, false, false);
            return new Image(texture);
        }
    
//        private var line:Shape = new Shape();
    
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
            fStage.addChild(line);
        }
    }
}