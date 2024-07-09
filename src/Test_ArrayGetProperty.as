package {

import flash.display.Sprite;

import utils.Utils;

public class Test_ArrayGetProperty extends Sprite {
    private const CHILDS:int = 10;
    public function Test_ArrayGetProperty() {
        
        var arr:Array = [];
        var vec:Vector.<Inner> = new Vector.<Inner>();
        
        var item:*;
        for(var i:int=0;i<CHILDS;i++){
            item = new Inner(Math.random() > 0.3 ? Utils.getRandom(0,100) : null);
            arr.push(item);
            vec.push(item);
        }
        var arr_ids:Array = getProperty(arr, "id");
        var vec_ids:Array = getProperty(vec, "id");
        trace(arr_ids);
        trace(vec_ids);
    }
    
    public function getProperty(iterable:Object, field:String):Array {
        var result:Array = [];
        for each(var obj:Object in iterable)
        {
            if (obj.hasOwnProperty(field))
            {
                result.push(obj[field]);
            }else{
                result.push(null);
            }
        }
        return result;
    }
}
}

dynamic class Inner extends Object{
//    public var id:int;
    
    public function Inner(value:* = null):void {
        if(value) this["id"] = value;
    }
}
