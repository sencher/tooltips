package {

import flash.display.Sprite;

public class Test_ArrayChain extends Sprite {
    private var swapEventNames:Array = ["TOTAL_WAR_1", "TOTAL_WAR_2", "TOTAL_WAR_3", "TOTAL_WAR_4", "TOTAL_WAR_5"];
    private var pointer:String = "TOTAL_WAR_3";
    public function Test_ArrayChain() {
        findNext();
        findNext();
        findNext();
        findNext();
        
        findPrevious();
        findPrevious();
        findPrevious();
        findPrevious();
        
    }
    
    private function findNext():void {
        pointer = swapEventNames[(swapEventNames.indexOf(pointer) + 1) % swapEventNames.length];
        trace("findNext", pointer);
    }
    
    private function findPrevious():void {
        var currentPosition:int = swapEventNames.indexOf(pointer);
        pointer = currentPosition ? swapEventNames[currentPosition - 1] : swapEventNames[swapEventNames.length - 1];
//        pointer = swapEventNames[(swapEventNames.indexOf(pointer) - 1) % swapEventNames.length];
        trace("findPrevious", pointer);
    }
}
}
