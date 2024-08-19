package wowp.utils.array
{
	/**
	 * возвращает массив объектов которые не содержатся в обоих коллекциях
	 * @param o_1
	 * @param o_2
	 * @return
	 */
	public function getDiff(o_1:Object, o_2:Object):Array {
		var o:Object;
		var result:Array = [];
		for each(o in o_1) {
			if (getKey(o_2, o) == null) {
				addOnce(result, o);
			}
		}
		for each(o in o_2) {
			if (getKey(o_1, o) == null) {
				addOnce(result, o);
			}
		}
		return result;
	}
	
}
