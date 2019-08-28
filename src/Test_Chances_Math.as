/**
 * Created by S.Senkov on 28.08.2019.
 */
package
{
    import flash.display.Sprite;
    
    import utils.Utils;
    
    public class Test_Chances_Math extends Sprite
    {
        private const SEARCH:int = 2;
        private const DECK:int = 30;
        private const TURNS:int = 30;
        
        private var positiveChance:Number = 0;
        private var positiveChanceCoin:Number = 0;
        private var cards:Number = 0;
        
        public function Test_Chances_Math()
        {
            trace(SEARCH, "of", DECK, "turns", TURNS);
            cards = DECK;
            for (var i:int = 0; i < 6; i++) {
                if (positiveChance >= 1) break;
                positiveChance += (1 - positiveChance) * SEARCH / cards--;
            }
            
            cards += 3;
            
            for (i = 0; i < TURNS; i++) {
                if (positiveChance >= 1) break;
                positiveChance += (1 - positiveChance) * SEARCH / cards--;
                trace(i+1, Utils.setPrecision(positiveChance, 3));
            }
            trace("First:", i, Utils.setPrecision(positiveChance, 3));
            
            cards = DECK;
            
            for (i = 0; i < 8; i++) {
                if (positiveChanceCoin >= 1) break;
                positiveChanceCoin += (1 - positiveChanceCoin) * SEARCH / cards--;
            }
            
            cards += 4;
            
            for (i = 0; i < TURNS; i++) {
                if (positiveChanceCoin >= 1) break;
                positiveChanceCoin += (1 - positiveChanceCoin) * SEARCH / cards--;
                trace(i+1, Utils.setPrecision(positiveChanceCoin, 3));
            }
            trace("Coin:", i, Utils.setPrecision(positiveChanceCoin, 3));
        }
    }
}
