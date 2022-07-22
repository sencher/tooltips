package legacy
{

import com.junkbyte.console.Cc;

import utils.wg.utils.array.findByFieldArray;
import utils.wg.utils.array.safeSplice;
import utils.wg.utils.array.sumObjectsByType;

public function sumAwards(source:Array):Array {
		Cc.errorcw("sumAwards", source);
		if (source == null) return [];
		source = source.slice();
		
		var obj:Object;
		
		source = sumObjectsByType(source, ["type", "id"], "kwargs.boost",
				[{type: "crew_member"}]);
		Cc.logc("sumAwards", "after sumObjectsByType1", source);
		source = sumObjectsByType(source, ["type", "id"], "value",
				[{type: "crew_member"},{type: "crew"}]);
		Cc.logc("sumAwards", "after sumObjectsByType2", source);
		
		// суммируем необученных пилотов
		var allCrew:Array = findByFieldArray(source, "type", "crew_member").concat(findByFieldArray(source, "type", "crew"))
		
		var crew:Array = [];
		for each (obj in allCrew) {
//			if (obj.id != 0) continue;
//			var ad:AwardData = AwardDataFactory.instance.getAwardData(obj);
			if (int(obj.ui.skillPoints) < 2) {
				crew.push(obj);
			}
		}
		
		if (crew.length > 1) {
			crew[0].value = crew.length;
			while (crew.length > 1) {
				safeSplice(source, crew.pop());
			}
		}

		Cc.infoc("sumAwards", "after", source);
		return source;
	}
	
}
