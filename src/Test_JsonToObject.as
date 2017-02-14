/**
 * Created by S.Senkov on 09.02.2017.
 */
package
{
	import flash.display.Sprite;
	
	public class Test_JsonToObject extends Sprite
	{
		private static const ASTEROIDS:String = "asteroids";
		private static const SLOW:String = "slow";
		private static const INVISIBILITY:String = "invisibility";
		
		private var data:Object = {};
		private var invisibilitySpots:Array;
		private var asteroidsSpots:Array;
		private var slowSpots:Array;
		
		public function Test_JsonToObject()
		{
			var jsonString:String = '{"asteroids":[[2500,2500,500,500,0,6]],"slow":[[2000,2000,200,300,0,6],[3000,3000,200,300,0,6]],"invisibility":[[1000,1000,200,300,0,6]]}';
//			var jsonString:String = '{"asteroids":[100],"asteroids":[101],"slow":[202],"slow":[203],"invisibility":[304],"invisibility":[305]}';
//			var jsonString:String = 'asteroids:100:100:50:50:0:6#asteroids:100:200:50:50:0:6#slow:200:100:50:50:0:6#slow:200:200:50:50:0:6#invisibility:300:100:50:50:0:6#invisibility:300:200:50:50:0:6';
			data.effect_areas = parseString(jsonString);
			var b = getEffectEllipses("slow_spot");
			
			
			try {
				var o:Object = JSON.parse(jsonString);
			}catch (e:Error){
				trace("onSectorList, effect_areas : Invalid JSON");
			}
			
			
			
			trace("sdsad");
		}
		
		private function parseString(jsonString:String):Object
		{
			var result:Object = {};
			var areas:Array = jsonString.split("#");
			
			for(var i:int = 0; i < areas.length; i++ ){
				var params:Array = areas[i].split(":");
				if(params.length > 6){
					if(!result[params[0]]){
						result[params[0]] = [params.splice(1)];
					}else{
						result[params[0]].push(params.splice(1));
					}
				}
			}
			return result;
		}
		
		public function getEffectEllipses(type:String):Array {
			var short:String = type.replace(/_spot/,"");
			if(!this[short + "Spots"]) {
				this[short + "Spots"] = new Array();
				if(data.hasOwnProperty("effect_areas") && data.effect_areas.hasOwnProperty(short)) {
					var spots:Array = data.effect_areas[short];
					for each (var spotData:Array in spots) {
						if(spotData.length > 5) {
							this[short + "Spots"].push(spotData);
						}
					}
				}
			}
			return this[short + "Spots"];
		}
	}
}
