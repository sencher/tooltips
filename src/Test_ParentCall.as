/**
 * Created by SenCheR on 02.09.2015.
 */
package {
	import flash.display.Sprite;

	public class Test_ParentCall extends Sprite {
		public function Test_ParentCall() {
			super();
//			height = 50;
//			var xx:Number = parent["height"];
//			trace(xx);
			var c:Test_ParentCallChild = new Test_ParentCallChild();
			addChild(c);
			c.check();
		}

		public function test():void{
			trace("BLA!");
		}
	}
}
