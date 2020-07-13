package utils {
public dynamic class ArrayWithNegative extends Array {
    public function ArrayWithNegative(...rest) {
        //super(rest);
    }
    
    override public function get length():uint {
        return super.length;
    }
    
    public function toString():String {
        var result:String = "***\n";
        for (var i:int = -100; i < 100; i++) {
            if (this[i] != undefined) {
                result += "[" + i + "]" + this[i] + "\n";
            }
        }
        return result;
    }
}
}
