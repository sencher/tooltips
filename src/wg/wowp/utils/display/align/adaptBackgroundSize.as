package wowp.utils.display.align
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	public function adaptBackgroundSize(sprite:Sprite):void {
		var stage:Stage = sprite.stage;
		if (stage == null) return;
		
		sprite.scaleX = sprite.scaleY = 1;
		if (stage.stageWidth < sprite.width && stage.stageHeight < sprite.height) return;
		
		var ratio:Number = sprite.width / sprite.height;
		var stageAspectRatio:Number = stage.stageWidth / stage.stageHeight;
		
		// чтобы слева небыла видна пустая полоска, добавляем по два пикселя в ширину
		if (stageAspectRatio > ratio) {
			sprite.width = stage.stageWidth + 2;
			sprite.height = stage.stageWidth / ratio;
		} else {
			sprite.height = stage.stageHeight;
			sprite.width = stage.stageHeight * ratio + 2;
		}
	}
}
