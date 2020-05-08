package {
	import com.junkbyte.console.Cc;
	
	import flash.display.Shape;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import utils.Utils;
	
	public class Test_ConsoleTopmost extends Sprite {
		private var box:Shape = Utils.createBox();
		public function Test_ConsoleTopmost() {
			Cc.start(this);
			addChildAt(box, this.numChildren );
//			box.topmo
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(event:MouseEvent):void {
			var r = Math.random();
			trace(r)
			Cc.setScale(r);
		}
	}
}
