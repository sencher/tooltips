package utils.wg.string.time
{
	public function seconds2String(value:int):String {
		return mills2String(value * 1000);
	}
	
}
