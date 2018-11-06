package {
import flash.display.Sprite;

public class Test_Sort extends Sprite {
    public function Test_Sort() {
        var v:Vector.<Item> = new Vector.<Item>();
        v.push(new Item(7));
        v.push(new Item(0));
        v.push(new Item(0));
        v.push(new Item(1));
        v.push(new Item(1));
        v.push(new Item(-1));
        //v.push(null);
        v.sort(compare);
        trace(v);

        var fod:* = findFirstWithFieldEqualValue(v, "order", 1);
        var fod2:* = findFirstWithFieldEqualValue(v, "order", 4);
        trace(fod, fod2);

        var a:Array = [];
        a.push(new Item(7));
        a.push(new Item(0));
        a.push(new Item(0));
        a.push(new Item(1));
        a.push(new Item(1));
        a.push(new Item(-1));
        //v.push(null);
        a.sort(compare);
        trace(a);

        var fod:* = findFirstWithFieldEqualValue(a, "order", 1);
        var fod2:* = findFirstWithFieldEqualValue(a, "order", 4);
        trace(fod, fod2);
    }

    private function compare(a:Item, b:Item):Number {
        if (a.order >= b.order) {
            return 1;
        }
        return -1;
    }

    public function findFirstWithFieldEqualValue(array:*, field:String, value:*):* {
        for each (var i:* in array) {
            if (i && i[field] == value) {
                return i;
            }
        }

        return null;
    }
}
}

class Item {
    public var order:int;

    public function Item(order:int) {
        this.order = order;
    }

    public function toString():String {
        return String(order);
    }
}
