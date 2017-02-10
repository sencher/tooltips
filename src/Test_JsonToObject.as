/**
 * Created by S.Senkov on 09.02.2017.
 */
package
{
	import flash.display.Sprite;
	
	public class Test_JsonToObject extends Sprite
	{
		public function Test_JsonToObject()
		{
//			var jsonString:String = "{\"asteroids\":[[2500,2500,500,500,0,6]],\"slow\":[[2000,2000,200,300,0,6],[3000,3000,200,300,0,6]],\"invisibility\":[[1000,1000,200,300,0,6]]}";
			var jsonString:String = '{"ast"eroids":[[2500,2500,500,500,0,6]],"slow":[[2000,2000,200,300,0,6],[3000,3000,200,300,0,6]],"invisibility":[[1000,1000,200,300,0,6]]}';
			//var o:Object = JSON.parse( jsonString );
			//trace(o);
			
//			var o2:Object =  "{invisibility:[[1000,1000,200,300,0,6]],asteroids:[[2500,2500,500,500,0,6]],slow:[[2000,2000,200,300,0,6],[3000,3000,200,300,0,6]]}";
//			trace(o2);
			//var s1:String = '{"x":200, "y":400}';
			
//			var jsonString:String = "'{}'";
			try {
				var o:Object = JSON.parse(jsonString);
			}catch (e:Error){
				trace("onSectorList, effect_areas : Invalid JSON");
			}
			
			
			
			trace("sdsad");
		}
	}
}
