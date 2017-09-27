package {
	import flash.display.Sprite;
	
	public class Test_Validator extends Sprite {
		public function Test_Validator() {
			var o:Object;
			var i:int;
			var s:String;
			var a:Array;
			
			validate(o);
			validate(i);
			validate(s);
			validate(a);
			
			validate("");
			validate(0);
			validate(false);
			validate(new int());
			validate(new String());
			validate(undefined);
			validate(null);
			validate(NaN);
			
			
			validate({});
			validate([]);
			validate(-1);
			validate(int);
			validate(new Array());
			validate(Infinity);
		}
		
		private function validate(value:*):void {
			//trace(typeof value);
			if (!value) {
				trace("!!! INVALID " + (typeof value) + " \"" + value + "\"");
			} else {
				trace((typeof value) + " \"" + value + "\" valid");
			}
		}
	}
}
