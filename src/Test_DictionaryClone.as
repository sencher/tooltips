package {

import flash.display.Sprite;
import flash.utils.Dictionary;

public class Test_DictionaryClone extends BaseTest {
    public function Test_DictionaryClone() {
        var dic:Dictionary = new Dictionary();
        dic["test"] = 5;
        dic["otherDic"] = new Dictionary();
        dic["otherDic"]["foo"] = 1;
        dic["otherDic"]["bar"] = "bar";
    
        var copy:Dictionary = clone(dic);
    
        dic["test"] = 0;
        dic["otherDic"]["foo"] = 0;
        dic["otherDic"]["bar"] = "changed";
        
        log(dic["test"], copy["test"]);
        log(dic["otherDic"]["bar"]);
    }
    
    private function clone(original:Dictionary):Dictionary {
        var cloned:Dictionary = new Dictionary();
        for(var key:Object in original) {
            if( original[key]  is Dictionary)
                cloned[key] = clone(original[key]);
            else
                cloned[key] = original[key];
        }
        return cloned;
    }
}
}
