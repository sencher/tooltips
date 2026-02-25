package wowp.utils.cost
{
	import flash.text.TextField;
	
	import scaleform.gfx.TextFieldEx;
	
	import wowp.hangar.vo.CostVO;
	import wowp.utils.display.text.substitution.ImageSubstitutionIcons;
	import wowp.utils.display.text.substitution.setSubstitutions;
	import wowp.utils.string.stringReplace;
	
	public function setCostListTextField(tf:TextField, string:String, patternsList:Array,
										 separator:String = ", "):void {
		var pattern:String;
		var cost:CostVO;
		var resultText:String = string;
		var costText:String;
		var isEnabled:Boolean;
		for (var i:int = 0; i < patternsList.length; i++) {
			pattern = patternsList[i][0];
			cost = patternsList[i][1];
			isEnabled = patternsList[i][2];
			costText = getCostString(cost, isEnabled, false, separator);
			resultText = stringReplace(resultText, pattern, costText);
		}
		tf.htmlText = resultText;
		setSubstitutions(tf);
	}
}
