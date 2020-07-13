/**
 * Created by S.Senkov on 09.02.2017.
 */
package {
import flash.display.Sprite;

import utils.ArrayWithNegative;

import utils.Utils;

public class Test_Random extends Sprite {
    private var array:ArrayWithNegative;
    
    public function Test_Random() {
        
        generateArray(0, 4);
        for (var i:int = 0; i < 1000; i++) {
            var rnd = Utils.getRandom(0, 4, [2]);
            array[rnd] += 1;
        }
        trace(array);
        
        generateArray(1, 5);
        for (var i:int = 0; i < 1000; i++) {
            var rnd = Utils.getRandom(1,5,[1,2,3,4]);
            array[rnd] += 1;
        }
        trace(array);
        
        generateArray(1, 5);
        for (var i:int = 0; i < 1000; i++) {
            var rnd = Utils.getRandom(1,5,[1,2,3,4,5]);
            array[rnd] += 1;
        }
        trace(array);
        
        generateArray(10, 20);
        for (var i:int = 0; i < 1000; i++) {
            var rnd = Utils.getRandom(10,20,[1,2,13,4,15]);
            array[rnd] += 1;
        }
        trace(array);
        
        generateArray(-3, 3);
        for (var i:int = 0; i < 1000; i++) {
            var rnd = Utils.getRandom(-3,3,[1,2,13,4,15]);
            array[rnd] += 1;
        }
        trace(array);
        Utils.traceArrayWithIndexes(array);
    }
    
    private function generateArray(min:int, max:int):void {
        array = new ArrayWithNegative();
        for (var i:int = min; i < max + 1; i++) {
            array[i] = 0;
        }
        
    }
}
}
