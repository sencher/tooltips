package utils.wg.utils.string
{
	
	public function paint(text:*, color:uint):String
	{
		return "<font color='#" + color.toString(16) + "'>" + text + "</font>";
	}
	
}