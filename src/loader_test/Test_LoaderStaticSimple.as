package loader_test {
public class Test_LoaderStaticSimple {
    private static var _active:Boolean = false;
    public static var name:String = "Default";

    public function Test_LoaderStaticSimple() {
    }

    public static function attack():void {
        trace(name, "attacked!", arguments);
    }

    public static function heal(value:int):void {
        trace(name, "healed", value, "//", arguments);
    }

    public static function giveItems(char:String, id1:int, id2:int):void {
        trace(name, "gives", id1, "and", id2, "to", char, "//", arguments);
    }

    public static function get active():Boolean {
        return _active;
    }

    public static function set active(value:Boolean):void {
        _active = value;
    }
}
}
