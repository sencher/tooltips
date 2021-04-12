package {
import flash.display.Sprite;


public class Test_TextMultipleHtmlSpaces extends Sprite {
    public function Test_TextMultipleHtmlSpaces() {
        trace(nbsp());
        trace(nbsp(2));
        trace(nbsp(5));
    }
    
    public function nbsp(value:int = 1):String {
        var result:String = "";
        for (var i:int = 0; i < value; i++) {
            result += "&nbsp;"
        }
        return result;
    }
}
}
