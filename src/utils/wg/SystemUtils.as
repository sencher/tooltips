package utils.wg
{
	import flash.external.ExternalInterface;
	
	import wowp.hangar.model.HangarModel;
	
	public class SystemUtils
	{
		private static var _isLowMemory:Boolean;
		private static var _isLowMemoryInitialized:Boolean;
		
		public static function get isLowMemory():Boolean {
			//	нельзя делать запрос до того, как питон повесит листенеры, по дефолту мы 32х
			if (HangarModel.bootState == 0) return true;
			if (_isLowMemoryInitialized) return _isLowMemory;
			_isLowMemory = ExternalInterface.call("system.isLowMemory");
			_isLowMemoryInitialized = true;
			return _isLowMemory;
		}
	}
}
