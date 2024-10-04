package AppDomain4Strategies {

public class SomeCoolDataVO {
    public var money:int = 9500;
    
    public function SomeCoolDataVO(value:int = 0) {
        if(value) money = value;
        trace("SomeCoolDataVO money:", money);
    }
}
}
