package utils.wg.string
{
	
	public function array2hash(array:Array):String 
	{
		array = array.slice();
		array.sort();
		return array.join("_");
	}

}