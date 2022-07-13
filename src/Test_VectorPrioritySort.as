package {

import flash.display.Sprite;

public class Test_VectorPrioritySort extends Sprite {
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
    
    private static const MAX:int = 20;
    
    public static const DICTIONARY:Array = [PLANE,TOTEM,ACHIEVMENT,ACHIEVEMENTS,PILOT,WAR_CACHE,FREE_EXP,PREMIUM,GOLD,GARBAGE];
    public static const P1:Array = [PLANE];
    public static const P2:Array = [TOTEM,ACHIEVEMENTS];
    public static const P3:Array = [ACHIEVEMENTS,PILOT,WAR_CACHE];
    public static const P4:Array = [FREE_EXP,PREMIUM,GOLD];
    
    private var vector:Vector.<Award> = new Vector.<Award>();
    
    public function Test_VectorPrioritySort() {
        for(var i:int = 0; i< MAX; i++) {
            vector.push(new Award(i));
        }
        
        trace(vector);
        vector = vector.sort(sortFunction);
        trace(vector);
    }
    
    private function sortFunction(a:Award, b:Award):int {
        return getPriority(a) - getPriority(b);
    }
    
    private function getPriority(a:Award):int {
        var type:String = a.type;
        if(P1.indexOf(type) > -1){
            return 1;
        }else if(P2.indexOf(type) > -1){
            return 2;
        }else if(P3.indexOf(type) > -1){
            return 3;
        }else if(P4.indexOf(type) > -1){
            return 4;
        }else {
            return 5;
        }
    }
}
}

import utils.Utils;

class Award{
    public var id:int;
    public var type:String;
    
    public function Award(id:int):void {
        this.id = id;
        var random:int = Utils.getRandom(0,15);
        if(random > 9) random = 9;
        type = Test_VectorPrioritySort.DICTIONARY[random];
    }
    
    public function toString():String {
        return id + ":" + type;
    }
}
