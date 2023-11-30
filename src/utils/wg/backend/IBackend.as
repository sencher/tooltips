package utils.wg.backend
{
	
	
	public interface IBackend 
	{
		/**
		 *  Registers an ActionScript method as callable from the backend.
		 * After a successful invocation of addCallBack(), the registered function in
		 * the player can be called by backend.
		 * @param	functionName
		 * @param	closure
		 */
		function addCallback(functionName:String, closure:Function):void;
		/**
		 * Calls a function exposed by the backend, passing zero or
		 * more arguments.  If the function is not available, the call returns
		 * null; otherwise it returns the value provided by the function. 
		 * @param	functionName
		 * @param	...rest
		 * @return
		 */
		function call(functionName:String, ...rest):*;
		
		function callArray(functionName:String, args:Array):*;
		/**
		 * Calls an asynchronous function exposed by the backend, passing zero or
		 * more arguments. It will be called after end of the current scope (setTimeout 1)
		 * @param	functionName
		 * @param	...rest
		 */
		function callAsync(functionName:String, ...rest):void;
		/**
		 * Unregisters all callable methods.
		 */
		function dispose():void;
	}
	
}