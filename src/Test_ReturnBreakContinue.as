package {
	import flash.display.Sprite;
	
	public class Test_ReturnBreakContinue extends Sprite {
		public function Test_ReturnBreakContinue() {
			//var i:int = 0;
			trace("1");
			if(true){
				trace("2");
				return;
				trace("3");
			}
			trace("4");
		}
	}
}
