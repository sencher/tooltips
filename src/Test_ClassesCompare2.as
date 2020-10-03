package {
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.IEventDispatcher;

public class Test_ClassesCompare2 extends Sprite {
    public function Test_ClassesCompare2() {
        //https://help.adobe.com/en_US/ActionScript/3.0_ProgrammingAS3/WS5b3ccc516d4fbf351e63e3d118a9b90204-7f8a.html
        var mySprite:Sprite = new Sprite();
        trace(mySprite is Sprite); // true
        trace(mySprite is DisplayObject);// true
        trace(mySprite is IEventDispatcher); // true
        trace("***************");
        trace(mySprite instanceof Sprite); // true
        trace(mySprite instanceof DisplayObject);// true
        trace(mySprite instanceof IEventDispatcher); // false
        trace("***************");
        trace(mySprite as Sprite);                 // [object Sprite]
        trace(mySprite as DisplayObject);                 // [object Sprite]
        trace(mySprite as IEventDispatcher);                 // [object Sprite]
        trace(mySprite as Number);                                       // null
    }
}
}
