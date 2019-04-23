package {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
    import flash.events.Event;
	
	import utils.Utils;
	
	public class Test_GlobalVisibility extends Sprite{

    private var s:Sprite;
    public function Test_GlobalVisibility() {
        s = new Sprite();
	    s.name = "child";
        addChild(s);
        log();
        removeChild(s);
        log();
    }
		
    private function log(event:Event = null):void {
        trace("-");
        trace(Utils.globalVisibleList(s));
        trace(Utils.globalVisible(s));
    }
}
}
