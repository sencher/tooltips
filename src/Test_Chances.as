/**
 * Created by S.Senkov on 23.04.2019.
 */
package
{
	import flash.display.Sprite;
	
	import utils.Utils;
	
	public class Test_Chances extends Sprite
	{
		private const COMBO:Array = [[1, 2], [3]];
		
		private const NUM_CARDS:int = 30;
		private const REPEATS:int = 100000;
		
		private var coin:Boolean = true;
		private var cards:Array = [];
		private var tempCards:Array = [];
		private var comboDrawn:Array = [];
		private var resultTurns:Array = [];
		private var resultDraws:Array = [];
		private var resultCoinTurns:Array = [];
		private var resultCoinDraws:Array = [];
		private var combo:Array = [];
		private var cardsDrawn:int;
		private var turns:int;
		private var firstHand:Boolean;
		private var repeats:int;
		
		public function Test_Chances()
		{
			while (repeats < REPEATS) {
				restart();
			}
			
			trace("First Turns:", Utils.averageOfArray(resultTurns), "Cards:", Utils.averageOfArray(resultDraws));
			trace("Coin Turns:", Utils.averageOfArray(resultCoinTurns), "Cards:", Utils.averageOfArray(resultCoinDraws));
		}
		
		private function restart():void
		{
			repeats++;
			combo = COMBO.concat();
			comboDrawn = [];
			cards = [];
			tempCards = [];
			coin = !coin;
			cardsDrawn = turns = 0;
			firstHand = true;
//			turns = 0;
			
			for (var i:int = 1; i < NUM_CARDS + 1; i++) {
				cards.push(i);
			}
			
			drawUntilCombo();
			
			if (!turns) turns = 1;
			
			if (!coin) {
				resultTurns.push(turns);
				resultDraws.push(cardsDrawn);
			} else {
				resultCoinTurns.push(turns);
				resultCoinDraws.push(cardsDrawn);
			}
		}
		
		private function drawUntilCombo():void
		{
			var card:int = drawCard();
			
			if (!checkCombo(card) && firstHand) {
				tempCards.push(card);
			}
			
			if (combo.length) {
				if (firstHand) {
					if ((!coin && cardsDrawn > 5 - comboDrawn.length) || (coin && cardsDrawn > 7 - comboDrawn.length)) {
						shuffleBack();
					}
				}
				drawUntilCombo();
			}
		}
		
		private function shuffleBack():void
		{
			cards = Utils.joinArrays(cards, tempCards);
			firstHand = false;
//			coin = !coin;
		}
		
		private function checkCombo(card:int):Boolean
		{
			for (var i:int = 0; i < combo.length; i++) {
				for (var j:int = 0; j < combo[i].length; j++) {
					if (combo[i][j] == card) {
						comboDrawn.push(card);
						combo.splice(i, 1);
						return true;
					}
				}
			}
			return false;
		}
		
		private function drawCard():int
		{
			if (!cards.length) return 0;
			
			cardsDrawn++;
			if (!firstHand) turns++;
			
			var id:int = Utils.getRandom(0, cards.length - 1);
//			trace(id, cards[id]);
			
			return cards.splice(id, 1);
//			trace(cards);
		}
	}
}
