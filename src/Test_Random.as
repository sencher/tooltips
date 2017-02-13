/**
 * Created by S.Senkov on 09.02.2017.
 */
package
{
	import flash.display.Sprite;
	
	public class Test_Random extends Sprite
	{
		private var array:Array = [0,0,0,0,0];
		public function Test_Random()
		{
			for (var i:int = 0; i< 1000; i++) {
				//var rnd = Math.floor(Math.random() * 5); // 0-4
				var rnd = getRandom(0,4);
				array[rnd] += 1;
			}
			
			trace(array, array[0]+array[1]+array[2]+array[3]+array[4]);
		}
		
		
		private function getRandom(min:int, max:int):int{
			return Math.floor(Math.random() * (max + 1 - min)) + min;
		}
	}
}
