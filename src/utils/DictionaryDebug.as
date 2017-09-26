package utils {
	import flash.utils.Dictionary;
	
	public class DictionaryDebug extends Dictionary {
		public function DictionaryDebug(weakKeys:Boolean = false) {
			super(weakKeys);
		}
		
//		public function set length(n:Number):void {
//			trace("length",n)
//			super.length = n;
//		}
//
//		public function set prototype(o:Object):void {
//			trace("prototype", o);
//			super.prototype = o;
//		}
//
//		public function set constructor(o:*):void {
//			trace("constructor", o);
//			super.constructor = o;
//		}
//
//		public function watch(prop:String, handler:Object):void {
//			trace("watch", arguments);
//			super.watch(prop, handler);
//		}
//
//		public function hasOwnProperty(propertyName:String):Boolean {
//			trace("hasOwnProperty", arguments);
//			return super.hasOwnProperty(propertyName);
//		}
//
//		public function propertyIsEnumerable(propertyName:String):Boolean {
//			trace("propertyIsEnumerable", arguments);
//			return super.propertyIsEnumerable(propertyName);
//		}
	}
}
