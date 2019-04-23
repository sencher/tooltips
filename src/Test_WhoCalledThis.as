package {
import flash.display.Sprite;

public class Test_WhoCalledThis extends Sprite {
    public function Test_WhoCalledThis() {
        Test_WhoCalledThis.whoCalledThis();
        someFunc()
    }

    private function someFunc():void{
        Test_WhoCalledThis.whoCalledThis();
    }

    public static function whoCalledThis(depth:int = 1):void{
        var e:Error = new Error();
        var stackTrace:String = e.getStackTrace();
        var lines:Array = stackTrace.split("\n\t");
        var cut:Array = lines.slice(2, 2 + depth);
        var s:String;
        var r:String = "";
        for each (s in cut) {
            r += s + "\n";
        }
        trace(r + "*************")
    }


}
}
