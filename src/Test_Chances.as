/**
 * Created by S.Senkov on 23.04.2019.
 */
package
{
	import flash.display.Sprite;
	
	import utils.Utils;
	
	import utils.Utils;
	
	public class Test_Chances extends Sprite
	{
		private var NUM_CARDS:int = 30;
		private var REPEATS:int = 1000;
		private var COMBO:Array = [[1, 2]];
//		private var COMBO:Array = [[1, 2], [3, 4]];
//		private var COMBO:Array = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]];
		
		private var cards:Array = [];
		private var comboDrawed:Array = [];
		private var results:Array = [];
		private var combo:Array = [];
		
		public function Test_Chances()
		{
			restart();
		}
		
		private function restart():void
		{
			combo = COMBO.concat();
			comboDrawed = [];
			cards = [];
			
			for (var i:int = 1; i < NUM_CARDS + 1; i++) {
				cards.push(i);
			}
			
			drawUntilCombo();
			//trace(combo, comboDrawed, NUM_CARDS - cards.length);
			results.push(NUM_CARDS - cards.length);
			if (results.length < REPEATS) {
				restart();
			} else {
				trace(Utils.averageOfArray(results));
			}
		}
		
		private function drawUntilCombo():void
		{
			var card:int = drawCard();
			checkCombo(card);
			if (combo.length) {
				drawUntilCombo();
			}
		}
		
		private function checkCombo(card:int):void
		{
			for (var i:int = 0; i < combo.length; i++) {
				for (var j:int = 0; j < combo[i].length; j++) {
					if (combo[i][j] == card) {
						comboDrawed.push(card);
						combo.splice(i, 1);
						return;
					}
				}
			}
		}
		
		private function drawCard():int
		{
			var id:int = Utils.getRandom(0, cards.length - 1);
//			trace(id, cards[id]);
			
			return cards.splice(id, 1);
//			trace(cards);
		}
	}
}
