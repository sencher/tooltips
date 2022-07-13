package utils {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.text.TextField;

public class DebugAssistant {
    public static function becomeProxyTF(tf:TextField):TextField {
        var parent:DisplayObject = tf.parent;
        if(!parent) return null;
        
        var debugTF:TextFieldProxy = new TextFieldProxy(tf);
        return TextField(debugTF);
    }
    
    public static function becomeDebugTF(tf:TextField):TextField {
        var parent:DisplayObjectContainer = tf.parent;
        if(!parent) return null;
        
        var debugTF:TextFieldDebug = new TextFieldDebug();
        Utils.mergeObjects(debugTF, tf, true);
        debugTF.inited = true;
        parent.removeChild(tf);
        parent.addChild(debugTF);
        return TextField(debugTF);
    }
}
}