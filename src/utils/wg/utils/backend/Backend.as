package utils.wg.utils.backend
{
	import flash.external.ExternalInterface;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	
	/**
	 * ExternalInterface wrapper
	 */
	public class Backend implements IBackend 
	{
		public var functions:Object = {};
		
		public function Backend() 
		{
		}
		
		public function addCallback(functionName:String, closure:Function):void
		{
			functions[functionName] = closure;
			ExternalInterface.addCallback(functionName, closure);
		}
		
		public function call(functionName:String, ...rest):*
		{
			if (rest == null)
			{
				rest = [];
			}
			rest.unshift(functionName);
			return ExternalInterface.call.apply(null, rest);
		}
        
        public function callArray(functionName:String, args:Array):* {
            return ExternalInterface.call.apply(null, args);
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
			ExternalInterface.call.apply(null, rest);
		}
		
		public function dispose():void
		{
			for (var functionName:String in functions)
			{
				ExternalInterface.addCallback(functionName, null);
			}
			functions = {};
		}
		
		public function empty():void{
            for (var functionName:String in functions)
            {
                ExternalInterface.addCallback(functionName, emptyCallback);
            }
		}
        
        private function emptyCallback(...args):void {
			
        }
	}

}