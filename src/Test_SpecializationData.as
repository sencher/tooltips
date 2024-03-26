package {

import flash.display.Sprite;

import wowp.data.ivo.compound.fitting.PlaneSpecializationData;

import wowp.data.ivo.compound.fitting.PlanesPresetsData;

public class Test_SpecializationData extends Sprite {
    public function Test_SpecializationData() {
        var plane1:int = 5101;
        var plane2:int = 4101;
        
        var planesPresetsData1:PlanesPresetsData = new PlanesPresetsData(plane1);
        var d11:PlaneSpecializationData = new PlaneSpecializationData(plane1, {});
        d11.installed = true;
        d11.canBuy = false;
        d11.bought = true;
        d11.locked = false;
        var d12:PlaneSpecializationData = new PlaneSpecializationData(plane1, {});
        d12.installed = false;
        d12.canBuy = false;
        d12.bought = true;
        d12.locked = false;
        planesPresetsData1.presets.push(d11,d12);
        
        var planesPresetsData2:PlanesPresetsData = new PlanesPresetsData(plane2);
        var d21:PlaneSpecializationData = new PlaneSpecializationData(plane2, {});
        d21.installed = true;
        d21.canBuy = false;
        d21.bought = true;
        d21.locked = false;
        var d22:PlaneSpecializationData = new PlaneSpecializationData(plane2, {});
        d22.installed = false;
        d22.canBuy = false;
        d22.bought = true;
        d22.locked = false;
        planesPresetsData2.presets.push(d21,d22);
    
    
        var planesPresetsData3:PlanesPresetsData = new PlanesPresetsData(plane2);
        var d11:PlaneSpecializationData = new PlaneSpecializationData(plane1, {});
        d11.installed = true;
        d11.canBuy = false;
        d11.bought = true;
        d11.locked = false;
        var d12:PlaneSpecializationData = new PlaneSpecializationData(plane1, {});
        d12.installed = false;
        d12.canBuy = false;
        d12.bought = true;
        d12.locked = false;
        planesPresetsData3.presets.push(d11,d12);
        
        trace(planesPresetsData1.isEqualWith(planesPresetsData3));
    }
}
}
