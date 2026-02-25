package wowp.utils.array 
{
	
	/**
	 * сортирует вектор по аналогии массива
	 * @param	vec
	 * @param	args
	 * @return
	 */
	public function vectorSortOn(vec:*, ...args):void
	{
		var array:Array = [];
		while(vec.length > 0) array.push(vec.pop());

		array.sortOn.apply(null, args);
		while(array.length > 0) vec.push(array.shift());
	}

}