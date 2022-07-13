package message {

import flash.utils.Dictionary;

public class MessageProxy {
    
    private static var fakeResponses:Dictionary = new Dictionary();
    private static var server:Server = new Server();
    
    public function MessageProxy() {
    }
    
    public static function addFakeResponse(request:String, response:Object, amount:int):void {
        fakeResponses[request] = [response, amount];
    }
    
    public static function call(request:String, callback:Function, data:Object):void {
        if(fakeResponses[request]){
            callback.call(0, fakeResponses[request][0]);
            
            if(--fakeResponses[request][1] <= 0){
                delete fakeResponses[request];
            }
        }else {
            data == null ? data = {realCallback:callback} : data.realCallback = callback;
            server.call(request, processResponse, data);
        }
    }
    
    public static function processResponse(request:Object, response:Object):void{
        trace("proxy got response", JSON.stringify(request), JSON.stringify(response));
        request.data.realCallback.call(0, response);
    }
}
}
