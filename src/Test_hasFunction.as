package {
import flash.display.Sprite;

public class Test_hasFunction extends Sprite {
    public function Test_hasFunction() {
        var o:Object = Object(new Inside());
//        var n = o.getValue().name;
//        trace(o.getValue)
//        trace(o.getValue())
//        trace(n);
        if(o.hasOwnProperty("getValue")){
            trace(o.getValue().name);
        }

        if(o.hasOwnProperty("getBullShit")){
            trace(o.getBullShit().name);
        }
    }
}
}

class Inside{
    public function Inside()
    {
        trace('class Inside constructor');
    }

    public function getValue():Object{
        return {name:"Inside"};
    }
}
