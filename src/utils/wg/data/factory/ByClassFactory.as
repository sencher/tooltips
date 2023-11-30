package utils.wg.data.factory
{
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;
	
	import wowp.utils.domain.createObject;
	
	public class ByClassFactory
	{
		private var _map:Dictionary = new Dictionary();
		
		public function register(voClass:Class, symbolClassName:String):void {
			_map[voClass] = symbolClassName;
		}
		
		public function getItem(vo:Object):DisplayObject {
			var className:String = _map[vo["constructor"]];
			if (className) {
				var renderer:DisplayObject = createObject(className) as DisplayObject;
				if (renderer["setData"] is Function) {
					renderer["setData"](vo);
				}
				return renderer;
			}
			return null;
		}
	}
}
