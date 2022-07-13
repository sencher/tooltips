package message {

import com.junkbyte.console.Cc;

import flash.utils.Dictionary;

public class DataBase {
    private static var users:Dictionary = new Dictionary();
    
    public function DataBase() {
    }
    
    public static function addUser(data:Object):void{
        users[data.name] = data;
    }
    
    public static function tryLogin(userData:Object):Boolean{
        Cc.logcw("tryLogin", userData);
        if(users[userData.l] && users[userData.l].passwoed == userData.p){
            return true;
        }
        
        return false;
    }
}
}
