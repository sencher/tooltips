package wowp.utils.array 
{
	
	public function toObjectByKey(array:Object, field:String):Object
	{
		var result:Object = {};
		for each(var obj:Object in array)
		{
			if (obj.hasOwnProperty(field))
			{
				result[obj[field]] = obj;
			}
		}
		return result;
	}

}