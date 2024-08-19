package wowp.utils.backend 
{
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	/**
	 * Abstract backend stub connector
	 */
	public class BackendStub implements IBackend 
	{
		private var _functions:Dictionary;	//	front -> back
		private var _callbacks:Dictionary;	//	back ->	front
		
		//	***	IBackend	***
		public function BackendStub() 
		{
			_functions = new Dictionary(true);
			_callbacks = new Dictionary(true);
		}
		
		public final function addCallback(functionName:String, closure:Function):void
		{
			_functions[functionName] = closure;
		}
		
		public final function call(functionName:String, ...rest):*
		{
			trace("Frontend -> Backend", functionName);
			if (_callbacks[functionName] is Function)
			{
				try
				{
					(_callbacks[functionName] as Function).apply(null, rest);
				}
				catch (e:Error)
				{
					trace(e.message)
				}
			}
			else
			{
				trace("BackendStub: handler is not installed!", functionName);
			}
		}
        
        public function callArray(functionName:String, args:Array):* {
            return call.apply(null, args);
        }
		
		public function callAsync(functionName:String, ...rest):void
		{
			if (rest == null)
			{
				rest = [];
			}
			rest.unshift(functionName);
			setTimeout(makeAsyncCall, 1, rest);
		}
		
		private function makeAsyncCall(rest:Array):void
		{
			call.apply(null, rest);
		}
		
		public final function dispose():void
		{
			_functions = new Dictionary(true);
			//	disposes pseudo-backend
			backendDispose();
		}
		
		//	***	Pseudo-backend abstraction	***
		//	Calls registered method from pseudo-backend
		protected final function call_1(functionName:String, ...rest):void
		{
			trace("Backend -> Frontend", functionName);
			if (_functions[functionName] is Function)
			{
				try
				{
					(_functions[functionName] as Function).apply(null, rest);
				}
				catch (e:Error)
				{
					trace(e.message)
				}
			}
			else
			{
				trace("BackendStub: handler is not installed!", functionName);
			}
		}
		
		//	Registers pseudo-backend method as callable from client
		protected final function addExternalCallback(functionName:String, closure:Function):void
		{
			_callbacks[functionName] = closure;
		}
		
		//	Disposes pseudo-backend
		protected final function backendDispose():void
		{
			//	abstract
		}
		
		/**
		 * 	Schedules callback
		 * @param	delay		- delay for callback invocation in milliseconds
		 * @param	callback	- callback
		 * @param	...args		- zero or more arguments which will be passed to the callback
		 */
		protected final function schedule(delay:int, callback:Function, ...args):void
		{
			args.unshift(delay);
			args.unshift(callback);
			setTimeout.apply(null, args);
		}
		
		/**
		 * 	Schedules call to the frontend
		 * @param	delay			- delay for call in milliseconds
		 * @param	functionName	- name of the call
		 * @param	...args			- zero or more arguments which will be passed to the frontend
		 */
		protected final function scheduleCall(delay:int, functionName:String, ...args):void
		{
			args.unshift(functionName);
			args.unshift(delay);
			args.unshift(call_1);
			setTimeout.apply(null, args);
		}
		
	}

}