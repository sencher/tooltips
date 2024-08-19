package wowp.utils.string
{
	
	public function toPercents(ratio:Number):String {
		if (isNaN(ratio))ratio = 0;
		return Math.round((ratio - 1) * 100) + "%"
	}
	
}
