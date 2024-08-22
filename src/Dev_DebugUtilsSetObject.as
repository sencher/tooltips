package {

import com.junkbyte.console.Cc;

import wowp.utils.debug.DebugUtils;

public class Dev_DebugUtilsSetObject extends BaseTest {
    private var o1:Object = {comment: "BLA!"};
    private var o2:SomeVO = new SomeVO(14);
    
    private var vo:*;
    
    public function Dev_DebugUtilsSetObject() {
        showConsole();
        Cc.pink(o1, o2);
        Cc.red("zzz", o1, "<", o2);
        Cc.blue(Cc.makeString("aaa", o1, "<", o2));
        
        
        setData(11);
        setData("");
        setData(o1);
        setData(null);
        setData("ez");
        setData([o1, 2, o2]);
        setData(o2);
        setData({});
    }
    
    public function setData(value:*):void {
//        Cc.green2cw(this, DebugUtils.set("setData", vo, value, name));
        Cc.green2cw(this, Cc.set("setData", vo, value, name));
        vo = value;
    }
}
}

class SomeVO {
    public var id:int;
    
    function SomeVO(value:int):void {
        id = value;
    }
}
