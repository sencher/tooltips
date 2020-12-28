package utils.wg.utils.display.text.substitution
{
	import flash.text.TextField;
	
	public function setSubstitutions(textfield:TextField):void {
		if (!textfield) return;
		if (!textfield.text) return;
		if (textfield.text.indexOf("{") == -1) return;
		ImageSubstitutionsProcessor.process(textfield);
	}
}
