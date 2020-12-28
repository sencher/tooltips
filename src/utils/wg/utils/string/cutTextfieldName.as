package utils.wg.utils.string
{
	import flash.text.TextField;
	
	public function cutTextfieldName(textfield:TextField, text:String, cut:String=".."):Boolean
	{
		if (text == null || textfield == null) return false;
		var arr:Array = cutNickname(text);
		var nick:String = arr[0];
		var clan:String = arr[1];
		var flag:Boolean = false;
		if (textfield != null)
		{
			textfield.text = nick + clan;
			var length:Number = text.length;
			while (textfield.textWidth >= textfield.width)
			{
				textfield.text = nick.substr(0, --length) + cut + clan;
				flag = true;
			}
		}
		return flag;
	}

}