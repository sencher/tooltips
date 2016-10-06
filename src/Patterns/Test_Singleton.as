/**
 * Created by SenCheR on 06.09.2016.
 */
package Patterns
{
	import flash.display.Sprite;

	public class Test_Singleton extends Sprite
	{
		public function Test_Singleton()
		{
			var s1:* = new Singleton();
			trace(Singleton.instance.field);
			Singleton.instance.field = 8;
			trace(Singleton.instance.field);
			var s2:* = new Singleton();
		}
	}
}
