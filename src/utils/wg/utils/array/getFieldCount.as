package utils.wg.utils.array
{
	
	public function getFieldCount(obj:Object):int 
	{
		var count:int = 0;
		for (var s:String in obj) count++;
		return count;
	}

}