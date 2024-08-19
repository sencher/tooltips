package wowp.utils.cost 
{
	import flash.text.TextField;

	import scaleform.gfx.TextFieldEx;

	import wowp.hangar.vo.CostVO;
	import wowp.utils.display.text.substitution.CertificatesSmallIcon;
	import wowp.utils.display.text.substitution.CertificatesSmallIconDisabled;
	import wowp.utils.display.text.substitution.CouponIcon;
	import wowp.utils.display.text.substitution.CouponIconDisabled;
	import wowp.utils.display.text.substitution.CouponSmallIcon;
	import wowp.utils.display.text.substitution.CouponSmallIconDisabled;
	import wowp.utils.display.text.substitution.CreditsIcon;
	import wowp.utils.display.text.substitution.CreditsIconDisabled;
	import wowp.utils.display.text.substitution.GoldIcon;
	import wowp.utils.display.text.substitution.GoldIconDisabled;
	import wowp.utils.display.text.substitution.ImageSubstitutionIcons;
	import wowp.utils.display.text.substitution.setSubstitutions;
	import wowp.utils.string.stringReplace;

	public function setCostTextField(tf:TextField, string:String, pattern:String, cost:CostVO, isEnabled:Boolean = true, checkResources:Boolean=false, separator:String = ", ", zeroCurrency:String = "credits"):void
	{
		if (!tf) return;
		var costText:String = getCostString(cost, isEnabled, checkResources, separator, true, zeroCurrency);

		tf.htmlText = stringReplace(string, pattern, costText);
		setSubstitutions(tf);
	}

}