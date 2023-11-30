package utils.wg.array
{
	

	public function getKeyArray(iterable:Object):Array 
	{
		var result:Array = [];
		for (var s:String in iterable)
		{
			result.push(s);
		}
		return result;
	}


}