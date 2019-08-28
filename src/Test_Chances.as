/**
 * Created by S.Senkov on 23.04.2019.
 */
package
{
    import flash.display.Sprite;
    
    import utils.Utils;
    
    public class Test_Chances extends Sprite
    {
        private const COMBO:Array = [[1,2]];
        
        private const DEBUG:Boolean = false;
        private const DEBUG_DRAW:Array = [25,27,9,28,22,5,14,20,13,11,27,30,4,6,3,21,15,26,23,8,12,28,5,16,17,9,22,18,29,19,7,24];
        
        private const NUM_CARDS:int = 30;
        private const REPEATS:int = 200001;
        private const TURN_LIMIT:int = 0;// 0 turn off
        private const FORCE_NO_COINS:Boolean = false;
        private const FORCE_ALL_COINS:Boolean = false;
        
        private var coin:Boolean = true;
        private var cards:Array = [];
        private var mulliganCards:Array = [];
        private var comboDrawn:Array = [];
        private var resultTurns:Array = [];
        private var resultDraws:Array = [];
        private var resultCoinTurns:Array = [];
        private var resultCoinDraws:Array = [];
        private var combo:Array = [];
        private var log:Array = [];
        private var cardsDrawn:int;
        private var turns:int;
        private var firstHand:Boolean;
        private var repeats:int;
        private var repeatsCoin:int;
        private var repeatsTotal:int;
        private var comboCompleted:int;
        private var comboCoinCompleted:int;
        
        public function Test_Chances()
        {
            while (repeatsTotal < REPEATS) {
                restart();
            }
            
            trace("First Turns:", Utils.setPrecision(Utils.averageOfArray(resultTurns), 2), "Cards:", Utils.setPrecision(Utils.averageOfArray(resultDraws), 2), "Completed:", Utils.setPrecision(comboCompleted / repeats, 3));
            trace("Coin Turns:", Utils.setPrecision(Utils.averageOfArray(resultCoinTurns), 2), "Cards:", Utils.setPrecision(Utils.averageOfArray(resultCoinDraws), 2), "Completed:", Utils.setPrecision(comboCoinCompleted / repeatsCoin, 3));
        }
        
        private function restart():void
        {
            repeatsTotal++;
            combo = COMBO.concat();
            comboDrawn = [];
            cards = [];
            mulliganCards = [];
            log = [];
            cardsDrawn = turns = 0;
            firstHand = true;
            
            if (FORCE_ALL_COINS) {
                coin = true;
            } else if (FORCE_NO_COINS) {
                coin = false;
            } else {
                coin = !coin;
            }
            
            if (coin) {
                repeatsCoin++;
            } else {
                repeats++;
            }
            
            if (DEBUG) {
                cards = DEBUG_DRAW.concat();
            } else {
                for (var i:int = 1; i < NUM_CARDS + 1; i++) {
                    cards.push(i);
                }
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
            if (TURN_LIMIT > 0 && turns >= TURN_LIMIT) {
                //trace(log);
                return;
            }
            
            var card:int = drawCard();
            log.push(card);
            
            if (!checkCombo(card) && firstHand) {
                mulliganCards.push(card);
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
            mulliganCards.length = coin ? 4 : 3;
            cards = Utils.joinArrays(cards, mulliganCards);
            firstHand = false;
        }
        
        private function checkCombo(card:int):Boolean
        {
            for (var i:int = 0; i < combo.length; i++) {
                for (var j:int = 0; j < combo[i].length; j++) {
                    if (combo[i][j] == card) {
                        comboDrawn.push(card);
                        combo.splice(i, 1);
                        if (!combo.length) {
                            if (coin) {
                                comboCoinCompleted++;
                            } else {
                                comboCompleted++;
                            }
                        }
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
            
            if(DEBUG){
                return cards.shift();
            }else {
                return cards.splice(Utils.getRandom(0, cards.length - 1), 1);
            }
        }
    }
}
