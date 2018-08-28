package {
import flash.display.Sprite;

public class Test_Sort extends Sprite{
    public function Test_Sort() {
        var v:Vector.<Item> = new Vector.<Item>();
        v.push(new Item(7));
        v.push(new Item(0));
        v.push(new Item(0));
        v.push(new Item(1));
        v.push(new Item(1));
        v.push(new Item(-1));
        v.sort(compare);
        trace(v);
    }

    private function compare(a:Item, b:Item):Number {
        if(a.order >= b.order){
            return 1;
        }
        return -1;
    }
}
}

class Item{
    public var order:int;

    public function Item(order:int) {
        this.order = order;
    }

    public function toString():String {
        return String(order);
    }
}
