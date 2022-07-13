package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.text.TextField;

[SWF(width="800", height="400")]
public class Test_Console extends Sprite {
    
    private var tf:TextField = new TextField();
    private const TEXT:String = "-123–我—abc多用途战斗机";
    
    public function Test_Console() {
        Cc.start(this);
        Cc.visible = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
        Cc.width = 800;
        Cc.height = 300;
        Cc.commandLine = true;
        
        tf.border = true;
        tf.y = 300;
        addChild(tf);
        tf.htmlText = TEXT;
        
        Cc.log(TEXT);
        Cc.log(tf.text);
        Cc.log(tf.htmlText);
        
        var o = {a:1,b:2,c:3}
        var a = ["a",17,{kk:"gg"}]
        var a3:Array = [[4,6], [2,8]];
//        Cc.logcw(this, o);
//        Cc.logcwj(this, o);
//        Cc.logcw(this, a);
        Cc.logcwj(this, []);
        Cc.logcwj(this, [[1,7]]);
        Cc.logcwj(this, a);
        Cc.logcwj(this, a3);
        trace(JSON.stringify(a3, "a", "b"))
    }
}
}
