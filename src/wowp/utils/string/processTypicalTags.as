package wowp.utils.string
{
	import wowp.account.constants.ColorConstants;
	import wowp.account.model.AccountModel;
	
	public function processTypicalTags(text:String):String {
		
		if (text.indexOf("{") == -1) return text;
		
		text = colorize(text, ColorConstants.SUBSTITUTIONS);
		
		text = stringReplace(text, "{nickname}",
				paint(AccountModel.instance.playerModel.nickname, ColorConstants.GOLD));
		text = stringReplaceBatch(text, StringConstants.BREAK_SUBSTITUTIONS);
		
		return text;
	}
}