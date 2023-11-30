package utils.wg.data.binding.objects
{
	import wowp.utils.data.binding.BindableObject;
	
	
	public class BindableInt extends BindableObject 
	{
		public function BindableInt(value:int = 0)
		{
			super(value);
		}
		
		public function get intValue():int
		{
			return int(_value);
		}
		
		public function set intValue(value:int):void
		{
			this.value = value;
		}
	}

}