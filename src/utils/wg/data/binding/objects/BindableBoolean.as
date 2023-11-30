package utils.wg.data.binding.objects
{
	import wowp.utils.data.binding.BindableObject;
	
	
	public class BindableBoolean extends BindableObject 
	{
		public function BindableBoolean(bool:Boolean=false)
		{
			super(bool);
		}
		
		public function get boolean():Boolean
		{
			return value;
		}
		
		public function set boolean(value:Boolean):void
		{
			this.value = value;
		}
		
		public function negate():void
		{
			this.value = !_value;
		}
	}

}