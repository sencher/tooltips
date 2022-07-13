package message {

import com.junkbyte.console.Cc;

import flash.display.Sprite;

public class Main extends Sprite {
    private var client:Client = new Client();
    
    public function Main() {
        Cc.start(this);
        Cc.visible = true;
        
        DataBase.addUser({name:"Denis", password:"123"});
        DataBase.addUser({name:"George", password:"756"});
        DataBase.addUser({name:"Chris", password:"768"});
        
        MessageProxy.addFakeResponse(Messages.LOGIN, {r:"login faked!"}, 1);
        MessageProxy.addFakeResponse(Messages.BULLSHIT, {r:"immitated!"}, 3);
        
        client.init("Denis", "123");
        client.init("George", "756");
        client.init("Leo", "991");
        client.init("Chris", "555");
    }
}
}
