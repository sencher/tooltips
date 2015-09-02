package
{
	import flash.display.Sprite;

	public class Test_InternalClass extends Sprite
	{
		var test:String;

		public function Test_InternalClass()
		{
			var ic:InternalClass = new InternalClass();
		}
	}
}
class InternalClass
{
	public function InternalClass()
	{
		trace('class InternalClass');
	}
}