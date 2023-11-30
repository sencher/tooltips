package utils.wg.data.binding
{
	public class SignalValid extends Signal
	{
		protected var _valid:Boolean;
		
		public function get isValid():Boolean {return _valid;}
		
		public function SignalValid(debugMessage:String = null) {
			super(debugMessage);
		}
		
		override public function fire(...args):void {
			_valid = true;
			super.fire.apply(null, args);
			dispose();
		}
		
		override public function add(slot:Function):void
		{
			if (_valid) {
				slot();
			} else {
				super.add(slot);
			}
		}
	}
}
