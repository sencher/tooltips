package utils.wg.utils.data.binding
{
	
	/**
	 * можно регистрировать последовательно набор функций, который будут выполнены в результате вызова фунции execute
	 */
	public class CallbackSet 
	{
		private var _functions:Vector.<CallbackHolder> = new Vector.<CallbackHolder>();
		
		public function clear():CallbackSet
		{
			_functions.length = 0;
			return this;
		}
		
		public function add(callback:Function, ...args):CallbackSet
		{
			var cbh:CallbackHolder = new CallbackHolder(callback, args);
			_functions.push(cbh);
			return this;
		}
		
		public function execute():void
		{
			var f:Vector.<CallbackHolder> = _functions.slice();
			var i:int = 0;
			var len:int = f.length;
			for (i; i < len; ++i)
			{
				f[i].invoke();
			}
		}
	}

}

class CallbackHolder
{
	public var callback:Function;
	public var args:Array;
	
	public function CallbackHolder(callback:Function, args:Array):void
	{
		this.callback = callback;
		this.args = args;
	}
	
	public function invoke():void
	{
		callback.apply(null, args);
	}
}