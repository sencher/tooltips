package {
	import com.adobe.serialization.json.JSON;
	
	import display.MovieClipWithEvents;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mx.events.PropertyChangeEvent;
	
	import utils.Utils;
	
	import utils.Utils;
	
	public class Test_VisibleEvent extends Sprite {
		private var mcDefault:MovieClip;
		private var mcDefault2:MovieClip;
		private var main:MovieClipWithEvents;
		private var mc1:MovieClipWithEvents;
		private var mc2:MovieClipWithEvents;
		private var mc3:MovieClipWithEvents;
		private var mc3b:MovieClipWithEvents;
		private var mc3c:MovieClipWithEvents;
		public function Test_VisibleEvent() {
			mcDefault = new MovieClip();
			mcDefault2 = new MovieClip();
			mcDefault.name = "mcDefault";
			mcDefault2.name = "mcDefault2";
			addChild(mcDefault);
			mcDefault.addChild(mcDefault2);
			
			//mcDefault.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, handler);//Flex
//			mcDefault.visible = false;
//
//			mcDefault.addEventListener(Event.CHANGE, handler);
//			addEventListener(Event.CHANGE, handler);
//			mcDefault.dispatchEvent(new Event(Event.CHANGE, true));
			
			
			main = new MovieClipWithEvents();
			mc1 = new MovieClipWithEvents();
			mc2 = new MovieClipWithEvents();
			mc3 = new MovieClipWithEvents();
			mc3b = new MimicMovie();
			mc3c = new MovieClipWithEvents();
			
			main.name = "main";
			mc1.name = "mc1";
			mc2.name = "mc2";
			mc3.name = "mc3";
			mc3b.name = "mc3b";
			mc3c.name = "mc3c";
			
			mcDefault2.addChild(main);
//			main.
			addChild(mc1);
			mc1.addChild(mc2);
			mc2.addChild(mc3);
//			mc1.addChild(mc3);
//			mc2.addChild(mc3);
			mc3.addChild(mc3b);
//			mc2.addChild(mc3c);
			
//			main.
			removeChild(mc1);
//			addChild(mc1);
			
			mc3.addEventListener(MovieClipWithEvents.VISIBILITY_CHANGED, handler);
			
			//mc3b.parentVisibilityChanged = null;
			
//			trace(mc3.globalVisible());
//			trace(mc3.globalVisibleList());
//			trace(Utils.globalVisibleList(mc3));
//			mc2.visible = false;
//			mc1.visible = false;
//			main.visible = false;
//			main.visible = true;
//			mcDefault.visible = false;
//			trace(Utils.globalVisibleList(mc3));
//			trace(mc3.globalVisible());
//			trace(mc3.globalVisibleList());
			
		}
		
		public function customHandler(event:Event):void {
			trace("BLA!")
		}
		
		private function handler(event:Event = null):void {
			trace(event.type, event.target.name, event.currentTarget.name, event.target.visible);
			//trace(com.adobe.serialization.json.JSON.encode(event));
		}
	}
}

import display.MovieClipWithEvents;

import flash.events.Event;

import utils.Utils;

class MimicMovie extends MovieClipWithEvents{
	public function MimicMovie(){
	
	}
	
	override protected function parentVisibilityChanged(event:Event):void {
		var targetVisibility:Boolean = event.target.visible;
		super.parentVisibilityChanged(event);
		trace("MimicMovie", name, targetVisibility);
		visible = targetVisibility;
	}
	
	override protected function removedFromStageHandler(event:Event):void {
		trace(Utils.whoCalledThis());
		trace(Utils.globalVisibleList(this));
		super.removedFromStageHandler(event);
	}
}