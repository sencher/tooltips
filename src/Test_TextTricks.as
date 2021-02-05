package {
import flash.display.Sprite;

public class Test_TextTricks extends Sprite {
    public function Test_TextTricks() {
        getFileName("icons/modules/equipment_24x24/bgEquipSlotR2.dds#icons/modules/equipment_24x24/equipUpratedGunsUniq11.dds");
        getFileName("icons/modules/equipment_24x24/bgEquipSlotR2.dds#icons/modules/equipment_24x24/equunsUniq22");
        getFileName("equipUprated3333.dds");
        getFileName("equ4");
        
    }
    
    private function getFileName(value:String):String {
        var lastSlash:int = value.lastIndexOf("/");
        var lastDot:int = value.lastIndexOf(".");
        if (lastDot < 0 || lastDot < lastSlash) {
            lastDot = int.MAX_VALUE;
        }
        var fileName = value.slice(lastSlash + 1, lastDot);
        trace(fileName);
        return fileName;
    }
}
}
