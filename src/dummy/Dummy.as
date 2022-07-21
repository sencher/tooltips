package dummy {

public class Dummy {
    public var id:int;
    public var type:String;
    
    public function Dummy(id:int, type:String) {
        this.id = id;
        this.type = type;
        trace(this, "created!");
    }
    
    public function toString():String {
        return "Dummy id:" + id + " type:" + type;
    }
}
}
