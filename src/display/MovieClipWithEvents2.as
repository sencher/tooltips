package display {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import utils.Utils;
	
	public class MovieClipWithEvents2 extends MovieClip {
		public function MovieClipWithEvents2() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		protected function onAddedToStage(event:Event):void {
			trace("onAddedToStage", name, parent.name, event.target.name, event.currentTarget.name);
		}
		
		protected function onRemovedFromStage(event:Event):void {
			trace("onRemovedFromStage", name, parent.name, event.target.name, event.currentTarget.name);
			trace(Utils.globalVisibleList(this));
		}
	}
}