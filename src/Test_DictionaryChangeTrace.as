package {
	import flash.display.Sprite;
	import flash.utils.describeType;
	import utils.DictionaryDebug;
	
	public class Test_DictionaryChangeTrace extends Sprite {
		private var d:DictionaryDebug;
		private var key:Object;
		public function Test_DictionaryChangeTrace() {
			d = new DictionaryDebug();
			key = {};
			d[key] = "aaa";
			var z = d[new Object()];
			trace(d, d[key]);
			trace(d.hasOwnProperty("key"));
			var o:Object = {};
			o.zzz = "added";
			var p = o.prototype;
			
			var dt = describeType(o);
			trace("1 "+dt.toXMLString());
		}
	}
}
