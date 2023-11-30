package utils.wg.timeout
{
	
	
	public interface IValidator 
	{
		function invalidate(...args):void;
		function dispose():void;
		function validateNow():void;
	}
	
}