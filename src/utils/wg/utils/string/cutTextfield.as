package utils.wg.utils.string
{	
	import flash.text.TextField;
	
	import wowp.utils.display.text.substitution.ImageSubstitutionsProcessor;
	
	public function cutTextfield(textfield:TextField, text:String, cut:String = "..."):Boolean
	{
		var flag:Boolean = false;
		
		if (textfield != null && text != null)
		{
			textfield.htmlText = text;
			ImageSubstitutionsProcessor.process(textfield);
			var length:Number = text.length;
			
			if (!textfield.multiline)
			{
				while (textfield.textWidth >= textfield.width)
				{
					textfield.htmlText = text.substr(0, --length) + cut;
					flag = true;
				}
			}else
			{				
				while (textfield.textHeight >= textfield.height)
				{
					textfield.htmlText = text.substr(0, --length) + cut;
					flag = true;
				}
			}
		}
		return flag;
	}
}