package {

import flash.display.Sprite;
import flash.utils.Dictionary;

public class Test_Dictionary extends Sprite {
    
    private static var PLANES_WITH_CAMOUFLAGE:Dictionary = new Dictionary();
    
    public static function fillPlanesWithCamouflage():void {
        PLANES_WITH_CAMOUFLAGE[3898] = "icons/presents/224x164/aircraft/US/xfy1_camo.dds";
        PLANES_WITH_CAMOUFLAGE[5903] = "icons/presents/224x164/aircraft/GB/sea_hawk_camo.dds";
    }
    
    public static function camouflageIcon(id:int):String {
        return PLANES_WITH_CAMOUFLAGE[id];
    }
    
    public function Test_Dictionary() {
        Test_Dictionary.fillPlanesWithCamouflage();
        trace(Test_Dictionary.camouflageIcon(3898));
        trace(Test_Dictionary.camouflageIcon(5903));
        trace(Test_Dictionary.camouflageIcon(0001));
        
        if(Test_Dictionary.camouflageIcon(0001)) {
            trace("do1");
        }
        if(Test_Dictionary.camouflageIcon(3898)){
            trace("do2");
        }
    }
}
}


