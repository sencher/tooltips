package {
	import flash.display.Sprite;
	
	import utils.Utils;
	
	public class Test_Random2 extends Sprite {
		public function Test_Random2() {
			showDebugPVEMatchEnd();
			showDebugPVEMatchEnd([11,23,37,41,56,68]);
		}
		
		private function showDebugPVEMatchEnd(itemsPool:Array = null) : void
		{
			trace("**********");
			var pveData: Object = {
				victory:true,
				match_time:"10:20",
				chests_found:0,
				rewards_data:[],
				players:[{name:"player1", kills:4, deaths:1, score:40}, {name:"player2", kills:14, deaths:10, score:4}]
			}
			
			var dictId: int;
			var rnd: int = Math.random() * 40;
			for (var i: int = 0; i < rnd; i++)
			{
				var worthValue: int = Math.random() * 4.9 + 1;
				
				if(itemsPool && itemsPool.length > 0){
					dictId = itemsPool[Utils.getRandom(0, itemsPool.length - 1)];
				}else{
					dictId = Math.random() * 1000 + 1;
				}
				trace(dictId);
				pveData.rewards_data.push({dict_id: dictId, bonus_amount:1, worth: worthValue});
			}

			return;

		}
	}
}
