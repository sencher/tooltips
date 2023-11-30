package utils.wg.string
{

	public function roundToString(value:Number, p:int = 2, separator:String="."):String
	{
		var result:String = Math.round(value * Math.pow(10, p)).toString();
		result = result.substr(0, result.length - p) + separator + result.substr(result.length - p, p);
		//	убираем нолики после разделителя
		for (var i:int = 0; i < p; ++i)
		{
			if (result.charAt(result.length - 1) == "0")
			{
				result = result.substr(0, result.length - 1);
			}
		}
		//	если после разделителя нету цифр, то убераем его
		if (result.charAt(result.length - 1) == separator)
		{
			result = result.substr(0, result.length - 1);
		}
		
		//	add leading zero before separator
		if (result.indexOf(separator) == 0)
		{
			result = "0" + result;
		}
		
		return result;
	}
}