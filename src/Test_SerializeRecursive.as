package {
import com.adobe.serialization.json.JSON;
import com.junkbyte.console.Cc;

import flash.display.Sprite;

public class Test_SerializeRecursive extends Sprite {
    private var a:Object = {};
    private var b:Object = {};

    public function Test_SerializeRecursive() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = 600;
        Cc.width = 500;

        a.name = "a";
        b.name = "b";

        a.link = b;
        trace(com.adobe.serialization.json.JSON.encode(a));

        b.link = a;

        Cc.log(a);

        try {
            trace(com.adobe.serialization.json.JSON.encode(a));// Error here
        }catch (e:Error){
            trace("Recursive Links Object");
        }
    }
}
}
