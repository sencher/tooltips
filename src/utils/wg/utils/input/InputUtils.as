package utils.wg.utils.input
{
	import flash.events.KeyboardEvent;
	import scaleform.clik.constants.InputValue;
	import scaleform.clik.ui.InputDetails;
	
	public class InputUtils 
	{
		
		public static function KeyboardEvent2InputDetails(e:KeyboardEvent):InputDetails
		{
			return new InputDetails("key", e.keyCode, e.type==KeyboardEvent.KEY_DOWN?InputValue.KEY_DOWN:InputValue.KEY_UP, null, 0, e.ctrlKey, e.altKey, e.shiftKey);
		}
	}

}