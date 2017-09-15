package {
import flash.display.Sprite;

public class Test_DefaultValuesComparing extends Sprite {
	public function Test_DefaultValuesComparing() {
		trace(undefined)
		trace(NaN)
		trace(null)
		trace(Infinity)
		trace(-Infinity)
		
		trace(undefined != 0);
		trace(undefined == 0);
		trace(undefined === 0);
		trace(undefined >= 0);
		trace(undefined <= 0);
		
		trace(NaN != 0);
		trace(NaN == 0);
		trace(NaN === 0);
		trace(NaN >= 0);
		trace(NaN <= 0);
		
		trace(null + undefined)
		
		trace(NaN != undefined)
		trace(NaN == undefined)
		trace(NaN === undefined)
		trace(NaN >= undefined)
		trace(NaN <= undefined)
		
		trace(-Infinity + Infinity);
		trace(Infinity - 1000);
		trace(Infinity >= 0);
		trace(-Infinity >= 0);
		
		if(Infinity){
			trace("TRUE");
		}
		
		if(-Infinity){
			trace("TRUE");
		}
		
		if(NaN || undefined || null){
			trace("TRUE");
		}else{
			trace("FALSE");
		}
	}
}
}
