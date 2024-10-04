package {

import flash.display.Sprite;

public class Test_ParseObject extends Sprite {
    private var o:Object = {1: ["aaa", "bbb"], 3: ["ccc"], 7: ["ddd"]};
    private var awards:Array = [["a1", "a2"], ["b1", "b2"], ["c1", "c2"]];
    
    public function Test_ParseObject() {
        addCustomAwards();
        trace(awards)
    }
    
    private function addCustomAwards():void {
        var customAwards:Object = o;
        //Cc.green2cw(this, "customAwards", customAwards);
        if (!customAwards) return;
        
        var curRange:int;
        for (var i:int in customAwards) {
            curRange = i - 1;
            if (awards[curRange]) {
                for each (var iconPath:String in o[i]) {
                    awards[curRange].unshift(iconPath);
                }
                
            }
        }
    }
}
}
