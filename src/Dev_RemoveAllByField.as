package {

import wowp.utils.array.findByField;
import wowp.utils.array.removeAllByField;
import wowp.utils.array.removeAllByFields;

public class Dev_RemoveAllByField extends BaseTest {
    public function Dev_RemoveAllByField() {
        var array:Vector.<vo> = new <vo>[
            new vo(1, 1),
            new vo(2, 7),
            new vo(3, 5),
            new vo(4, 4),
            new vo(5, 4),
            new vo(6, 4),
            new vo(7, 3),
            new vo(8, 1),
            new vo(9, 3)
        ]
        
//        removeAllByField(array, "type", 4);
        array = removeAllByFields(array, "type", [4,1]);
        log(array);
    }
}
}

class vo{
    public var id:uint;
    public var type:*;
    
    public function vo(id:uint, type:*):void {
        this.id = id;
        this.type = type;
    }
    
    public function toString():String {
        return "{id:" + id + ", type:" + type + "}";
    }
}