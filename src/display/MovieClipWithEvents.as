package display {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class MovieClipWithEvents extends MovieClip {
		public static const VISIBILITY_CHANGED:String = "visibilityChanged";
		public static const PARENT_VISIBILITY_CHANGED:String = "parentVisibilityChanged";
		
		public function MovieClipWithEvents() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		private function onRemovedFromStage(event:Event):void {
			trace("onRemovedFromStage", name, parent.name);
			parent.removeEventListener(MovieClipWithEvents.VISIBILITY_CHANGED, parentVisibilityChanged);
		}
		
		private function onAddedToStage(event:Event):void {
			trace("onAddedToStage", name, parent.name);
			parent.addEventListener(MovieClipWithEvents.VISIBILITY_CHANGED, parentVisibilityChanged);
		}
		
		public function parentVisibilityChanged(event:Event):void {
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
		
		public function globalVisible():Boolean {
			trace(this, this.name);
			var checking:DisplayObject = this;
			while(checking){
				if(!checking.visible){
					return false;
				}else if(checking.parent){
					checking = checking.parent;
				}else{
					return true;
				}
			}
			return true;// to make Idea happy

//			if(!visible){
//				return false;
//			}else if(parent is MovieClipWithEvents){
//				return MovieClipWithEvents(parent).globalVisible();
//			}else if(parent is DisplayObject){
//				return parent.visible;
//			}
//			return true;
		}
		
		public function globalVisibleList():String {
			var result:String = "";
			trace(this, this.name);
			var checking:DisplayObject = this;
			while(checking){
				
				result += getNameAndVisible(checking);
				
				if(checking.parent){
					checking = checking.parent;
				}else{
					return result;
				}
			}
			return result;// to make Idea happy
		}
		
		private function getNameAndVisible(displayObject:DisplayObject):String {
			return displayObject + ", " + displayObject.name + ", " + displayObject.visible + "\n";
		}
	}
}
