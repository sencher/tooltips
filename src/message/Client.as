package message {

public class Client {
    private var name:String;
    private var password:String;
    
    public function Client() {
    }
    
    public function init(name:String, password:String):void {
        this.name = name;
        this.password = password;
        
        MessageProxy.call(Messages.LOGIN, onLogin, {l:name, p:password});
        MessageProxy.call(Messages.START, onStart, null);
        MessageProxy.call(Messages.BULLSHIT, onBullshit, null);
    }
    
    private function onLogin(value:Object):void {
        trace(name, "login success:", value.r);
    }
    
    private function onStart(value:Object):void {
        trace(name, "start success:", value.r);
    }
    
    private function onBullshit(value:Object):void {
        trace(name, "bullshit success:", value.r);
    }
}
}
