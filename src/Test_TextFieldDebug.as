package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.text.TextField;

import utils.DebugAssistant;

import utils.TextFieldProxy;
import utils.Utils;

[SWF(width=600,height=600)]
public class Test_TextFieldDebug extends Sprite {
//    private var txt:TextFieldDebug = new TextFieldDebug();
    private var txt:TextField = new TextField();
    public function Test_TextFieldDebug() {
        Cc.start(this);
        Cc.visible = true;
        
        txt.border = true;
        txt.text = "init";
        txt.y = stage.stageWidth - 100;
        txt.width = 300;
        addChild(txt);
        
        trace(txt);
//        removeChild(txt);
//        txt = null;
//        trace(txt);
//        var d = new TextFieldDebug();
//        txt = d;
//        trace(txt);
//        addChild(txt);
//
//
//        txt.text = "2134";
//        txt.y = 70;
        
//        var debug = DebugAssistant.becomeDebugTF(txt);
//        txt = debug;
//        trace(debug);
        
        
        var proxy = DebugAssistant.becomeProxyTF(txt);
        txt = proxy;
        trace(proxy);
        
        txt.text = "2134";
        txt.x = 125;
        txt.y -= 70;
    }
}
}
