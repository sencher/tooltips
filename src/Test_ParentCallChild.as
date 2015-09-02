/**
 * Created by SenCheR on 02.09.2015.
 */
package {
	import flash.display.Sprite;

	public class Test_ParentCallChild extends Sprite {
		public function Test_ParentCallChild() {
			trace('created');
		}

		internal function check():void {
			var p = parent;
//			p.test();
			var f = p["test"];
			trace(f);
			f.call();
		}
	}
}