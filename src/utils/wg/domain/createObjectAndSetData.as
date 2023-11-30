package utils.wg.domain
{
	import wowp.utils.data.ISetData;
	
	public function createObjectAndSetData(name:String, vo:Object = null):Object {
		var ir:Object = createObject(name);
		if (vo != null && ir is ISetData) {
			(ir as ISetData).setData(vo);
		}
		return ir;
	}
	
}
