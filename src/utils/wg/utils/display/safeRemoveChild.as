package utils.wg.utils.display
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	public function safeRemoveChild(container:DisplayObjectContainer, child:DisplayObject):void
	{
		if(child!=null && container!=null && container==child.parent)container.removeChild(child);
	}

}