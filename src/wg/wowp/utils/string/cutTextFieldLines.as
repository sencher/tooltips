package wowp.utils.string
{
	import flash.text.TextField;
	
	import wowp.utils.display.text.substitution.setSubstitutions;
	
	public function cutTextFieldLines(tf:TextField, text:String, lines:int, autosize:String = "left"):Boolean {
		tf.htmlText = text;
		tf.autoSize = autosize;
		
		setSubstitutions(tf);
		
		var cut:Boolean = false;
		
		if (lines > 0) {
			while (tf.numLines > lines) {
				text = text.substring(0, text.length - 2);
				tf.htmlText = text + "...";
				tf.autoSize = autosize;
				cut = true;
			}
		}
		return cut;
	}
	
}
