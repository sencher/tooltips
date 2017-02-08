/**
 * Created by S.Senkov on 08.02.2017.
 */
package starling
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class TestDrawStarling extends Sprite
	{
		public function TestDrawStarling()
		{
			var nBox:Shape = new Shape();
			nBox.graphics.beginFill(0xff0000, 1);
			nBox.graphics.drawRect(-100,0,100,200);
			nBox.graphics.endFill();

//        var s = RunAnt.flashStage;
//        s.addChild(line);
			
			var im:Image = flashSpriteToImage(nBox);
			im.x = im.y = 300;
			//_gameObject.addToLayer(im, EntityDisplayStarling.TOP_LAYER);
		}
		
		private function flashSpriteToImage(sprite:DisplayObject):Image{
			var bitmapData:BitmapData = new BitmapData(sprite.width, sprite.height, true, 0x00000000);
			bitmapData.draw(sprite);
			var texture:Texture = Texture.fromBitmapData(bitmapData, false, false);
			return new Image(texture);
		}
	}
}
