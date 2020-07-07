package {
import flash.display.Sprite;

import utils.Utils;

public class Test_Cards3InARow extends Sprite {
    private const DEBUG:Boolean = false;
    private const GAMES:int = 10000;
    private const EACH_COLOR_CARDS:int = 10;
    private const BBB:String = "bbb";
    private const BBR:String = "bbr";
    private const BRB:String = "brb";
    private const RBB:String = "rbb";
    private const BRR:String = "brr";
    private const RBR:String = "rbr";
    private const RRB:String = "rrb";
    private const RRR:String = "rrr";
    private var deck:Array = [];
    private var initDeck:Array = [];
    private var table:String = "";
    private var p1:String = "";
    private var p2:String = "";
    private var p1wins:int = 0;
    private var p2wins:int = 0;
    private var draws:int = 0;


    public function Test_Cards3InARow() {
        //inspired: https://youtu.be/s4tyO4V2im8?t=588
        Utils.traceTfInit(stage);
        for (var i:int = 0; i < EACH_COLOR_CARDS; i++) {
            initDeck.push("b");
        }

        for (i = 0; i < EACH_COLOR_CARDS; i++) {
            initDeck.push("r");
        }

        p1 = RBR;
        p2 = BRR;
        for (var i:int = 0; i < GAMES; i++) {
            restart();
        }
        Utils.traceTf(p1wins, draws, p2wins);
    }

    private function restart():void {
        deck = initDeck.concat();
        table = "";

        for (var i:int = 0; i < EACH_COLOR_CARDS * 2; i++) {
            table += drawCard();
            if (table.substr(table.length - p1.length, p1.length) == p1) {
                p1wins++;
                if (DEBUG) Utils.traceTf("1", table);
                return;
            } else if (table.substr(table.length - p1.length, p1.length) == p2) {
                p2wins++;
                if (DEBUG) Utils.traceTf("2", table);
                return;
            }
        }
        draws++;
        if (DEBUG) Utils.traceTf("Draw", table);
//        Utils.traceTf(table);
//        Utils.traceTf(BBB, Utils.patternOccurrencesOverlayed(BBB,table));
//        Utils.traceTf(BBR, Utils.patternOccurrencesOverlayed(BBR,table));
//        Utils.traceTf(BRB, Utils.patternOccurrencesOverlayed(BRB,table));
//        Utils.traceTf(RBB, Utils.patternOccurrencesOverlayed(RBB,table));
//        Utils.traceTf(BRR, Utils.patternOccurrencesOverlayed(BRR,table));
//        Utils.traceTf(RBR, Utils.patternOccurrencesOverlayed(RBR,table));
//        Utils.traceTf(RRB, Utils.patternOccurrencesOverlayed(RRB,table));
//        Utils.traceTf(RRR, Utils.patternOccurrencesOverlayed(RRR,table));
    }

    private function drawCard():String {
        if (!deck.length) return "0";

        return deck.splice(Utils.getRandom(0, deck.length - 1), 1);
    }
}
}
