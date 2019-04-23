package loader_test {

import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.system.ApplicationDomain;
import flash.utils.getDefinitionByName;

public class Test_LoaderSecond extends Sprite {
    private var c:Class;
    private var s:Class;

    public function Test_LoaderSecond() {

        com.junkbyte.console.Cc;
        Test_LoaderStaticSimple;

        c = Class(getDefinitionByName("com.junkbyte.console::Cc"));
//
//        cc("start", this);
//
//        cc("visible", true);
//        cc("xxx", false);
//        cc("logchw", "ch1", this)
//
//
        s = Class(getDefinitionByName("loader_test::Test_LoaderStaticSimple"));
//        simple("name", "Genzo");
//        simple("_active", true);
//        simple("active", true);
//        simple("xxx", true);
//        simple("attack", true);
//        simple("heal", 7,8,9);
//        simple("giveItems", "Trader", 12, 13);
    }

    public function test():void {
        trace("Second alive!");
    }

    public function cc(prop:String, ... params):* {
        return callStatic(c, prop, params);
    }

    public function simple(prop:String, ... params):* {
        return callStatic(s, prop, params);
    }

    public function callStatic(cls:Class, prop:String, ... params):* {
        params = params[0];
        var property:* = cls[prop];
        //method
        if(property is Function){
            trace(cls, prop, "METHOD", prop, "/params", params);
            cls[prop].apply(null, params);
        //setter
        }else {
            if(params.length > 0) {
                cls[prop] = params[0];
                trace(cls, prop, "SET", property, "==>", params[0]);
            }else{
                //getter
                trace(cls, prop, "GET", property);
                return property;
            }
        }
    }
}
}
