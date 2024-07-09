package  {
	
	import flash.display.MovieClip;
	
	
	public class eButton extends MovieClip {
		private var _renderer:String;
		
		[Inspectable(name="itemRenderer", defaultValue="eButtonClass")]
		public function set itemRendererName(value:String):void {
			trace("6666 ButtonBar.set itemRendererName name:", name, "value:", value);
			_renderer = value;
			trace("_renderer:", _renderer);
		}
		
		public function eButton() {
			trace("eButton.cons _renderer:", _renderer);
		}
		
		public function get renderer():String {
			return _renderer;
		}
	}
	
}
