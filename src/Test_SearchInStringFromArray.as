package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;

[SWF(width=800, height=500)]
public class Test_SearchInStringFromArray extends Sprite {
    public function Test_SearchInStringFromArray() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = stage.stageHeight;
        
        
        var messages:Array = ["Result","system","bla"];
        for each (var message:String in messages){
            parse(message);
        }
        
    }
    
    private function parse(message:String):void {
        Cc.green2("parse", message);
        var lowerCase:String = message.toLowerCase();
        var userful:Array = ["result", "ystem"];
        for each (var search:String in userful) {
            if (lowerCase.indexOf(search) > -1) {
                Cc.infoc(this, '-=> processResponse:', message);
            }
        }
    }
}
}
