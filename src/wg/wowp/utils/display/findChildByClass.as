package wowp.utils.display
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	public function findChildByClass(container:DisplayObjectContainer, childClass:Class):DisplayObject {
		var len:int = container.numChildren;
		for (var i:int = 0; i < len; i++) {
			var child:DisplayObject = container.getChildAt(i);
			if (child is childClass) {
				return child;
			}
		}
		return null;
	}
	
}
