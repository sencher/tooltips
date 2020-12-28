package utils.wg.utils.data.binding
{
	public class Flag extends Signal
	{
		private var _flag:Boolean;
		
		public function Flag(flag:Boolean = false)
		{
			_flag = flag;
		}
		
		public function get flag():Boolean { return _flag; }
		
		public function set flag(value:Boolean):void
		{
			if (_flag != value) {
				_flag = value;
				fire();
			}
		}
		
		public function negate():void {
			_flag = !_flag;
			fire();
		}
	}
}