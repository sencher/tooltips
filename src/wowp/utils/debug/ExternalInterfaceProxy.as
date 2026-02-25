package wowp.utils.debug {

import com.junkbyte.console.Cc;

import flash.external.ExternalInterface;
import flash.utils.Dictionary;

public class ExternalInterfaceProxy {
    private static var callbacks:Dictionary = new Dictionary();
    
    public function ExternalInterfaceProxy() {

    }
    
    public static function addCallback(functionName:String, closure:Function):void{
        //Cc.redcw("ExternalInterfaceProxy", "addCallback", arguments);
        pushCallback(functionName, closure);
        ExternalInterface.addCallback(functionName, processResponse);
    }
    
    public static function call(... rest):*{
        //Cc.grassc("ExternalInterfaceProxy", "call", rest);
        var instantResponse:* = ExternalInterface.call.apply(0, rest);
        //Cc.green2("instantResponse",instantResponse);
        if(instantResponse != null){
            //Cc.redcw("ExternalInterfaceProxy", "instantResponse", rest, instantResponse);
            return instantResponse;
        }
    }
    
    public static function pushCallback(functionName:String, closure:Function):void {
        //Cc.yellowcw("ExternalInterfaceProxy", "pushCallback", functionName, closure);
        if(callbacks[functionName]){
            callbacks[functionName].push(closure);
            //Cc.blue(callbacks[functionName]);
        }else{
            callbacks[functionName] = [closure];
            //Cc.purple(callbacks[functionName]);
        }
    }
    
    public static function processResponse(...rest):void{
        //Cc.redcw("ExternalInterfaceProxy", "processResponse", rest);
    }
}
}
