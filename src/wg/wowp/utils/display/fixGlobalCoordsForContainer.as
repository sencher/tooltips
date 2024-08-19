package wowp.utils.display
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	public function fixGlobalCoordsForContainer(d:DisplayObjectContainer):void {
		if (d == null) return;
		var len:int = d.numChildren;
		for (var i:int = 0; i < len; i++) {
			var ch:DisplayObject = d.getChildAt(i);
			fixGlobalCoords(ch);
			if (ch is DisplayObjectContainer) {
				fixGlobalCoordsForContainer(ch as DisplayObjectContainer);
			}
		}
	}
	
}
