package clone {
public class ChildData {
    public var childName:String;
    
    public function ChildData(name:String = "DefaultChild") {
        this.childName = name;
    }
    
    public function toString():String {
        return "[ChildData childName=" + childName + "]";
    }
}
}