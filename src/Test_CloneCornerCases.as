package {
import flash.display.Sprite;
import flash.utils.ByteArray;

import legacy.HashMap;
import legacy.TutorialStatus;
import legacy.math.Long;

import utils.GamuaFloxUtils;

public class Test_CloneCornerCases extends Sprite {
    public function Test_CloneCornerCases() {
        var long1:Long = new Long(-1234567890123456);
        var long2:* = GamuaFloxUtils.cloneObject(long1);
        trace(long1, long2);

        var ts1:TutorialStatus = TutorialStatus.enabled;
        var ts2:TutorialStatus = GamuaFloxUtils.cloneObject(ts1);

        var d1:DataVO = new DataVO(779);
//        var d2:* = GamuaFloxUtils.cloneObject(d1);
//        https://pigiuz.wordpress.com/2009/12/02/as3-reflection-crapyness/

        var v1:Vector.<TutorialStatus> = new Vector.<TutorialStatus>();
        v1.push(TutorialStatus.testing);
        var v2 = GamuaFloxUtils.cloneObject(v1);

        var ar1:Array = [1, 2, "223", TutorialStatus.testing];
        var ar2 = GamuaFloxUtils.cloneObject(ar1);

//        var _class:Class = DataVO;
//        var objectClone:* = new _class([339, "aaa"]);

        var hash1:HashMap = new HashMap();
        hash1.put("Zozo", 17);
        hash1.put("Zozo", "cers");
        hash1.put(DataVO, TutorialStatus);
        var ks = hash1.keySet();
        var v = hash1.values();
        var hash2:HashMap = GamuaFloxUtils.cloneObject(hash1, 8);


        trace("end");
        //return new this["constructor"](name);
    }

    function clone(source:*):* {
        var array:ByteArray = new ByteArray();
        array.writeObject(source);
        array.position = 0;
        return array.readObject();
    }
}
}

class DataVO {
    private var _i:int;
    private var _s:String;

    public function DataVO(i:int, s:String = "zzz") {
        _i = i;
        _s = s;
    }
}