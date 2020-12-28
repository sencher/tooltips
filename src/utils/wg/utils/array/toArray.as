package utils.wg.utils.array
{
	/**
	 * преобразовывает коллекцию в массив
	 * @param    iterable
	 * @return
	 */
	public function toArray(iterable:Object):Array
	{
		var ret:Array = [];
		if (iterable is Array || iterable is Vector.<*> || iterable is Vector.<int> || iterable is Vector.<uint> || iterable is Vector.<Number>) {
			var len:int = iterable.length;
			for (var i:int = 0; i < len; ++i) {
				ret[i] = iterable[i];
			}
		} else {
			for each (var elem:Object in iterable) {
				ret.push(elem);
			}
		}
		
		return ret;
	}
	
	
}