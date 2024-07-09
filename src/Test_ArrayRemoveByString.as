package {

import flash.display.Sprite;

public class Test_ArrayRemoveByString extends Sprite {
    public function Test_ArrayRemoveByString() {
        var arr:Array = ["qwe","asd","zxc","qaz","wsx","edc","qsc","zse"];
        trace(removeByString(arr,"d"));
        trace(removeByString(arr,"c"));
        trace(removeByString(arr,"s"));
    
        var arr:Array = ["qwee","weasd","zxc","qaz","wwesx","edc","qwesc","zweswe"];
        trace(removeByString(arr,"we"));
        
        var arr:Array = ["qwee","zweswe"];
        trace(removeByString(arr,"we"));
    }
    
    public function removeByString(value:Array, match:String):Array {
        var result:Array = [];
        for(var i:int;i<value.length;i++){
            if(String(value[i]).indexOf(match) == -1){
                result.push(value[i]);
            }
        }
        
        return result;
    }
}
}
