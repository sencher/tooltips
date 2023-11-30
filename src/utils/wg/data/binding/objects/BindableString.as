package utils.wg.data.binding.objects
{
	import wowp.utils.data.binding.BindableObject;
	
	
	public class BindableString extends BindableObject 
	{
		public function BindableString(value:String = "")
		{
			super(value);
		}
		
		public function get stringValue():String
		{
			return String(_value);
		}
		
		public function set stringValue(value:String):void
		{
			this.value = value;
		}
	}

}