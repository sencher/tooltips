package {
import com.junkbyte.console.Cc;

import flash.display.MovieClip;

import flash.display.Sprite;

import utils.Utils;

[SWF(width=800, height=300, backgroundColor=0x888888)]
public class Test_ConsoleGarbareCollector extends Sprite {
    public function Test_ConsoleGarbareCollector() {
        Utils.addConsole(stage);
        func();
    }
    
    private function func():void {
        var a:Object = {a1:1};
        var b:Object = {b1:2};
        var c:Object = {c1:3};
        var d:Object = {d1:4};
        a.b = b;
        b.c = c;
        c.d = d;
        d.a = a;
        
//        Cc.logchwj("ch", "func", {a:1},{b:2},{c:3},{d:4},{e:5},{f:6},{g:7})
//        Cc.logchwj("ch", "func", new MovieClip(),new MovieClip(),new MovieClip());
        Cc.green2cwj("ch", "func", a,b,c,d);
        Cc.explodech("ch",a,1);
        Cc.explodech("ch",a,3);
        Cc.explodech("ch",a,5);
    }
}
}
