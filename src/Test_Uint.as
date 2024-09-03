package {

public class Test_Uint extends BaseTest {
    public function Test_Uint() {
        var u1:uint = getUint();
        log(u1);
        var i1:int = getUint();
        log(i1);
    }
    
    private function getUint():uint {
        return -1;
    }
}
}
