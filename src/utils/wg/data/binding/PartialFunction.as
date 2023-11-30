package utils.wg.data.binding
{
	public class PartialFunction
	{
		private var _args:Array;
		private var _callback:Function;
		
		public function PartialFunction(callback:Function, ...args) {
			_callback = callback;
			_args = args;
		}
		
		public function execute(...args):* {
			return _callback.apply(null, args.concat(_args));
		}
	}
}
