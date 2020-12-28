package utils.wg.utils.display.debug
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public function showBorders(doc:DisplayObjectContainer):void
	{
		var sprBoreders:Sprite = new Sprite();
		for (var i:int = 0; i < doc.numChildren; i++)
		{
			var child:DisplayObject = doc.getChildAt(i);
			var bounds:Rectangle = doc.getBounds(child);
			sprBoreders.graphics.lineStyle(1,Math.random()*0xffffff);
			sprBoreders.graphics.drawRect(bounds.x,bounds.y,bounds.width, bounds.height);

			if(child is DisplayObjectContainer)
			{
				showBorders(child as DisplayObjectContainer);
			}
		}
		doc.addChild(sprBoreders);
	}
}
