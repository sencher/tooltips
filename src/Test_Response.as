/**
 * Created by SenCheR on 02.09.2015.
 */
package {
	import flash.display.Sprite;

	public class Test_Response extends Sprite {
		public function Test_Response() {
			var arr:Array = [];
			var gameResultParams = {};
			if(arr) trace("bla");
			trace(gameResultParams.win / gameResultParams.bet > 2);
			var n:int = 50;
			trace(n);
			n += gameResultParams.win;
			trace(n);
		}
	}
}
