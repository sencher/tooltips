package wowp.utils.display
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;

	public function unSetMouseEnabledForTextFields(container:DisplayObjectContainer):void {
		var len:int = container.numChildren;
		for (var i:int = 0; i < len; ++i) {
			var d:DisplayObject = container.getChildAt(i);
			if (d is TextField) {
				(d as TextField).mouseEnabled = false;
			}
		}
	}
	
}
