package utils.wg.utils.display
{
	import flash.text.TextField;
	
	import wowp.utils.display.text.substitution.ImageSubstitutionsProcessor;
	import wowp.utils.display.text.substitution.setSubstitutions;
	import wowp.utils.string.processTypicalTags;
	
	public function setText(tf:TextField, text:String):void {
		if (tf == null) return;
		text = processTypicalTags(text);
		tf.htmlText = text;
		tf.autoSize = tf.defaultTextFormat.align;
		setSubstitutions(tf);
	}
	
}
