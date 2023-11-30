package utils.wg.array
{
	public function getIntKeyArray(iterable:Object):Array
	{
		var result:Array = [];
		for (var s:String in iterable)
		{
			result.push(int(s));
		}
		return result;
	}
}
