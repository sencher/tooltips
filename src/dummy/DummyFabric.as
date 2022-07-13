package dummy {

import utils.Utils;

public class DummyFabric {
    
    private static var _instance:DummyFabric;
    private static var _counter:int;
    
    private static const PLANE:String = "PLANE";
    private static const TOTEM:String = "TOTEM";
    private static const ACHIEVMENT:String = "ACHIEVMENT";
    private static const ACHIEVEMENTS:String = "ACHIEVEMENTS";
    private static const PILOT:String = "PILOT";
    private static const WAR_CACHE:String = "WAR_CACHE";
    private static const FREE_EXP:String = "FREE_EXP";
    private static const PREMIUM:String = "PREMIUM";
    private static const GOLD:String = "GOLD";
    private static const GARBAGE:String = "GARBAGE";
    
    public static const DICTIONARY:Array = [PLANE,TOTEM,ACHIEVMENT,ACHIEVEMENTS,PILOT,WAR_CACHE,FREE_EXP,PREMIUM,GOLD,GARBAGE];
    
    
    public function DummyFabric(e:SingletonEnforcer)
    {
        if (e == null) {
            throw(new Error("Please use instance!"));
        }
    }
    
    public static function get insnatce():DummyFabric {
        if(!_instance){
            _instance = new DummyFabric(new SingletonEnforcer());
        }
        return _instance;
    }
    
    public function getDummy():Dummy {
        var random:int = Utils.getRandom(0,15);
        if(random > 9) random = 9;
        return new Dummy(_counter++, Test_VectorPrioritySort.DICTIONARY[random]);
    }
}
}
class SingletonEnforcer
{
}