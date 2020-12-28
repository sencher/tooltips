package utils.wg.utils.display
{
	import flash.display.DisplayObjectContainer;
	
	public function getChildren(container:DisplayObjectContainer, childClass:Class=null):Array {
		var children:Array = [];
		if (container) {
			for (var cnt:int = 0; cnt < container.numChildren; cnt++) {
				if (childClass == null || container.getChildAt(cnt) is childClass) {
					children.push(container.getChildAt(cnt));
				}
			}
		}
		return children;
    }
    
}
