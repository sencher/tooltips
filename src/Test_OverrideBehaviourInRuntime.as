package {
	import flash.display.Sprite;
	
	public class Test_OverrideBehaviourInRuntime extends Sprite {
		public function Test_OverrideBehaviourInRuntime() {
			var u = new Unit();
			u.action();
			u.action = changedAction;
			u.action();
		}
		
		private function changedAction():void {
			trace("changedAction");
		}
	}
	
}

class Unit{
	public var action:Function;
	
	public function Unit(){
		action = predefinedPrivateAction;
	}
	
	private function predefinedPrivateAction():void {
		trace("predefinedPrivateAction");
	}
}
