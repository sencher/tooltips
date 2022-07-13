package {

import flash.display.Sprite;

import utils.wg.utils.array.findByField;

public class Test_FindByField extends Sprite {
    private var _bonuses:Vector.<Dummy>;
    public function Test_FindByField() {
        _bonuses = new <Dummy>[];
        _bonuses.push(new Dummy("A", 1));
        _bonuses.push(new Dummy("B", 2));
        var result:Object = findByField(_bonuses, "id", 2);
        trace(result, result.name);
    }
    
    /**
     * найти первый объект в массиве array, в котором поле field равно value
     * @param	array	-	массив в котором происходит масссив
     * @param	field	- 	поле
     * @param	value	- 	знечение поля
     * @return
     */
    public function findByField(iterable:Object, field:String, value:Object):Object
    {
        for each(var obj:Object in iterable)
        {
            if (obj.hasOwnProperty(field) && obj[field] == value)
            {
                return obj;
            }
        }
        return null;
    }
}
}

class Dummy{
    public var name:String;
    public var id:int;
    
    public function Dummy(name:String, id:int){
        this.name = name;
        this.id = id;
    }
}
