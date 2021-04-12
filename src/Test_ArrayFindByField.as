package {
import flash.display.Sprite;

public class Test_ArrayFindByField extends Sprite {
    private var array:Array = [];
    
    public function Test_ArrayFindByField() {
        array.push(new ComplicatedChild(3, 2, 1));
        array.push(new ComplicatedChild(7, 8, 3));
        array.push(new ComplicatedChild(11, 5, 3));
        array.push(new ComplicatedChild(11, 2));
        trace(array[0]);
        
        trace(findFromArrayByField(array, "a", 11));
        trace(findFromArrayByField(array, "d", 11));
        
        trace(cutFromArrayByField(array, "a", 11));
        trace(array.length);
        trace(cutFromArrayByField2(array, "a", 11));
        trace(array.length);
        trace(cutFromArrayByField(array, "d", 11));
        trace(array.length);
    }
    
    private function findFromArrayByField(array:Array, field:String, value:int):* {
        for (var i:int = 0; i < array.length; i++) {
            if (array[i].hasOwnProperty(field) && array[i][field] == value) {
                return array[i];
            }
        }
        return null;
    }
    
    private function cutFromArrayByField(array:Array, field:String, value:int):* {
        var result:*;
        for (var i:int = 0; i < array.length; i++) {
            if (array[i].hasOwnProperty(field) && array[i][field] == value) {
                result = array[i];
                array.splice(i, 1);
                return result;
            }
        }
        return null;
    }
    
    public function cutFromArrayByField2(iterable:Object, field:String, value:Object):Object {
        for each(var obj:Object in iterable) {
            if (obj.hasOwnProperty(field) && obj[field] == value) {
                iterable.splice(iterable.indexOf(obj), 1);
                return obj;
            }
        }
        return null;
    }
}
}

class ComplicatedChild{
    public var a:int;
    public var b:int;
    public var c:int;
    function ComplicatedChild(a:int = 0, b:int = 0, c:int = 0){
        this.a = a;
        this.b = b;
        this.c = c;
    }
    
    public function toString():String {
        return a + "," + b + "," + c;
    }
}
