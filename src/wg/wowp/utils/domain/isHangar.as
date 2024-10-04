package wowp.utils.domain
{
	import flash.display.DisplayObject;
	
	import wowp.core.eventPipe.EventPipe;
	
	public function isHangar():Object
	{
		if (EventPipe.dispatcher) {
			return (EventPipe.dispatcher as DisplayObject).loaderInfo.url.split("/").pop() == "hangar.swf";
		} else {
			return false;
		}
	}

}