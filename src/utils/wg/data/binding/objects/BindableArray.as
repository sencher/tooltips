package utils.wg.data.binding.objects
{
	import wowp.utils.data.binding.BindableObject;
	
	public class BindableArray extends BindableObject 
	{
		public function BindableArray(array:Array=null)
		{
			super(array);
		}
		
		public function get array():Array
		{
			return _value as Array;
		}
		
		public function set array(value:Array):void
		{
			this.value = value;
		}
	}
}