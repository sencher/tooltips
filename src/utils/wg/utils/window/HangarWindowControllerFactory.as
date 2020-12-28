package utils.wg.utils.window
{
	import wowp.utils.data.binding.Signal;
	
	public class HangarWindowControllerFactory
	{
		public const onOpen:Signal = new Signal();//HangarWindowController
		
		private var _path:String;
		private var _isModal:Boolean;
		
		public function HangarWindowControllerFactory(path:String, isModal:Boolean) {
			_path = path;
			_isModal = isModal;
		}
		
		public function open(payload:Object = null):void {
			onOpen.fire(new HangarWindowController(_path).modal(_isModal).defaultPayLoad(payload));
		}
	}
}
