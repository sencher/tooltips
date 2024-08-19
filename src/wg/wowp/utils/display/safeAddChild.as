package wowp.utils.display 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	public function safeAddChild(container:DisplayObjectContainer, child:DisplayObject):void
	{
		if(child!=null && container!=null && container!=child.parent)container.addChild(child);
	}

}