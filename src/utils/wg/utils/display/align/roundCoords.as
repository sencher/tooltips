package utils.wg.utils.display.align
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;

	public function roundCoords(doc:DisplayObjectContainer):void
	{
		for (var i:int = 0; i < doc.numChildren; i++)
		{
			var child:DisplayObject = doc.getChildAt(i);
			child.x = Math.round(child.x);
			child.y = Math.round(child.y);
			if(child is DisplayObjectContainer)
			{
				roundCoords(child as DisplayObjectContainer);
			}
		}
	}
}
