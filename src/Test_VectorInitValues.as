package {

public class Test_VectorInitValues extends BaseTest {
    //new no "Vector" word. Doesn`t work in Scaleform when init in class field in 1 line. Init in constructor.
    private const LETTERS:Vector.<String> = new <String>[a, b, c];
    private var a:String = "a";
    private var b:String = "b";
    private var c:String = "c";
    
    public function Test_VectorInitValues() {
        trace(LETTERS[1]);
    }
}
}
