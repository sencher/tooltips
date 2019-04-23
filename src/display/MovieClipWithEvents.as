package display {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import utils.Utils;
	
	/*
		Debug class
	 */
	public class MovieClipWithEvents extends MovieClip {
		public static const VISIBILITY_CHANGED:String = "visibilityChanged";
		public static const PARENT_VISIBILITY_CHANGED:String = "parentVisibilityChanged";
		
		public function MovieClipWithEvents() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
		}
		
		protected function removedFromStageHandler(event:Event):void {
			trace("removedFromStageHandler", name, parent.name, event.target.name, event.currentTarget.name);
			trace(Utils.whoCalledThis());
//			trace(Utils.globalVisibleList(this));
			parent.removeEventListener(MovieClipWithEvents.VISIBILITY_CHANGED, parentVisibilityChanged);
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function enterFrameHandler(event:Event):void {
			trace("enterFrameHandler", name);
//			trace(Utils.globalVisibleList(this));
			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			var topParent:DisplayObject = Utils.getTopParent(this);
			if(topParent != this) trace(name + " noticed that " + topParent.name + " was removed!");
		}
		
		protected function addedToStageHandler(event:Event):void {
			trace("addedToStageHandler", name, parent.name, event.target.name, event.currentTarget.name);
			parent.addEventListener(MovieClipWithEvents.VISIBILITY_CHANGED, parentVisibilityChanged);
		}
		
		protected function parentVisibilityChanged(event:Event):void {
			trace("parentVisibilityChanged", name, event.target.name, event.target.visible);
			var i:int;
			var child:DisplayObject;
			for (i = 0; i < numChildren; i++){
				child = getChildAt(i);
				if(child is MovieClipWithEvents){
					MovieClipWithEvents(child).parentVisibilityChanged(event);
				}
			}
		}
		
		override public function set visible(value:Boolean):void {
			if(visible != value) {
				super.visible = value;
				dispatchEvent(new Event(VISIBILITY_CHANGED/*, true*/));
			}
		}
	}
}
