package {

import com.junkbyte.console.Cc;
import com.junkbyte.console.core.ConsoleUtils;

import flash.display.Sprite;
import flash.text.TextField;

[SWF(width="800", height="800")]
public class Test_Console extends Sprite {
    
    private var tf:TextField = new TextField();
    private const TEXT:String = "-123–我—abc多用途战斗机";
    
    public function Test_Console() {
        Cc.start(this);
        Cc.visible = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
        Cc.width = stage.stageWidth;
        Cc.height = stage.stageHeight;
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
        var a2 = ["a",17,{kk:"gg", zz:{zalupa:"konya"},data:[{ebana:"v rot", mars:"snickers",e:4},{aha:"cool"}]},14,4];
        var a3:Array = [[4,6], [2,8]];
        Cc.logj( []);
        Cc.logj( [[1,7]]);
        Cc.logj( o);
        Cc.logj( a);
        Cc.logj( a2);
        Cc.logj( a3);
        //trace(JSON.stringify(a3, "a", "b"));
        
//        Cc.log(ConsoleUtils.formatJsonString("[\"a\",17,{kk:\"gg\", zz:{zalupa:\"konya\"},data:[{ebana:\"v rot\", mars:\"snickers\",e:4}]}]"));
//        Cc.log(ConsoleUtils.formatJsonString("[\"a\",17,{kk:\"gg\", zz:{zalupa:\"konya\"},data:[{ebana:\"v rot\", mars:\"snickers\",e:4}]}]"));
    }
}
}
