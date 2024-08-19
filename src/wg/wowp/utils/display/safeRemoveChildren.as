package wowp.utils.display
{
	import flash.display.DisplayObject;
	
	public function safeRemoveChildren(...children):void {
		for each(var child:DisplayObject in children){
			if(child.parent!=null){
				child.parent.removeChild(child);
			}
		}
	}
	
}
