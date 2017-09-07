package {
import com.adobe.serialization.json.JSON;

import flash.display.Sprite;

public class Test_SerializeRecursive extends Sprite {
    private var a:Object = {};
    private var b:Object = {};

    public function Test_SerializeRecursive() {
        a.link = b;
        trace(com.adobe.serialization.json.JSON.encode(a));

        b.link = a;
        trace(com.adobe.serialization.json.JSON.encode(a));// Error here
    }
}
}
