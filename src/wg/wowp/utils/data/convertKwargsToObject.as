package wowp.utils.data
{
	//	[{dictKey:mainSkillID, dictValue:1}, {dictKey:skillLevel, dictValue:100}, {dictKey:skillPoints, dictValue:5}]
	//  {mainSkillID:1, skillLevel:100, skillPoints:5}
	public function convertKwargsToObject(data:Object):Object {
		var result:Object = {};
		if(data is Array){
			for each(var obj:Object in data) {
				result[obj.dictKey] = obj.dictValue;
			}
		}
		return result;
	}
	
}
