package utils.wg.utils.string
{
	
	public function array2hash(array:Array):String 
	{
		array = array.slice();
		array.sort();
		return array.join("_");
	}

}