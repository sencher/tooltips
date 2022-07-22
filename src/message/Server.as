package message {

import flash.utils.Dictionary;

public class Server {
    private var links:Dictionary = new Dictionary();
    
    public function Server() {
        links[Messages.LOGIN] = processLogin;
        links[Messages.START] = processStart;
    }
    
    public function call(request:String, callback:Function, data:Object = null):void {
        if(links[request]){
            callback.call(0, {r:request, realCallback:callback, data:data},links[request].call(0, data));
        }
    }
    
    private function processLogin(data:Object = null):Object{
        if(DataBase.tryLogin(data)){
            return {r:"logged in"}
        }
        return {r:"invalid"}
    }
    
    private function processStart(data:Object = null):Object{
        return {r:"started"}
    }
}
}
