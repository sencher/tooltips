package wowp.utils.backend {

import flash.external.ExternalInterface;
import flash.utils.setTimeout;

import wowp.utils.array.ArrayUtils;
import wowp.utils.debug.DebugAssistant;

/**
 * ExternalInterface wrapper
 */
public class Backend implements IBackend {
    public var functions:Object = {};
    
    public function Backend() {
    }
    
    public function addCallback(functionName:String, closure:Function):void {
        functions[functionName] = closure;
        ExternalInterface.addCallback(functionName, closure);
    }
    
    public function call(functionName:String, ...rest):* {
        if (rest == null) {
            rest = [];
        }
        rest.unshift(functionName);
        return makeAsyncCall(rest);
    }
    
    public function callArray(functionName:String, args:Array):* {
        return makeAsyncCall(args);
    }
    
    public function callAsync(functionName:String, ...rest):void {
        if (rest == null) {
            rest = [];
        }
        rest.unshift(functionName);
        setTimeout(makeAsyncCall, 1, rest);
    }
    
    private function makeAsyncCall(rest:Array):* {
        if (DebugAssistant.IGNORE_LOGOUT) {
            for (var i:int = 0; i < rest.length; i++) {
                rest = ArrayUtils.removeByString(rest, "ServerDisconnecting");
            }
        }
        return ExternalInterface.call.apply(null, rest);
    }
    
    public function dispose():void {
        for (var functionName:String in functions) {
            ExternalInterface.addCallback(functionName, null);
        }
        functions = {};
    }
    
    public function empty():void {
        for (var functionName:String in functions) {
            ExternalInterface.addCallback(functionName, emptyCallback);
        }
    }
    
    private function emptyCallback(...args):void {
    
    }
}

}