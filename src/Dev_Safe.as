package {

import com.junkbyte.console.Cc;

public class Dev_Safe extends BaseTest {
    private var o1:Object = {a:{b:{c:3}}}
    private var o2:Object = {a:{b:{c:{d:{e:{f:{g:7}},k:{l:{m:16}}}}}}}
    
    public function Dev_Safe() {
        showConsole();
        Cc.green(safe(o1, "a.b.c"));
        Cc.green(safe(o1, "a.z.c"));
        Cc.green(safe(o2, "a.b.c.d.e.f.g"));
        Cc.green(safe(o2, "a.b.c.d.e.f.g.h"));
        Cc.green(safe(o2, "a.b.c.d.k.l.m"));
        Cc.green(safe(o2, "a.b.c.d.e.k.l.m"));
        Cc.green(safe(o2, "a.b.c.d"));

    }
    
    public function safe(value:Object, path:String):* {
        if (!value) return null;
        
        var array:Array = path.split(".");
        var currentObject:Object = value;
        for (var i:int = 0; i < array.length; i++) {
            if(currentObject.hasOwnProperty(array[i])){
                currentObject = currentObject[array[i]];
            }else {
                return null
            }
        }
       return currentObject;
    }
}
}
