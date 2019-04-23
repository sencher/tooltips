package {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
    import flash.events.Event;
	
	import utils.Utils;
	
	public class Test_AddChild extends Sprite{
    public function Test_AddChild() {
        addEventListener(Event.ADDED_TO_STAGE, log);
        addEventListener(Event.ADDED, log);
        addEventListener(Event.REMOVED_FROM_STAGE, log);
        addEventListener(Event.REMOVED, log);
        
        
        var s:Sprite = new Sprite();
	    s.name = "child";
	    s.addEventListener(Event.ADDED_TO_STAGE, log);
	    s.addEventListener(Event.ADDED, log);
	    s.addEventListener(Event.REMOVED_FROM_STAGE, log);
	    s.addEventListener(Event.REMOVED, log);
        
        addChild(s);
        removeChild(s);
    }
		
    private function log(event:Event):void {
        trace("-");
        trace(event.type, event.currentTarget, event.target);
        trace(Utils.globalVisibleList(DisplayObject(event.target)));
    }
}
}
