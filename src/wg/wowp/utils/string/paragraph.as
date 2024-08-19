package wowp.utils.string
{
	
	public function paragraph(text:String, styleClass:String = null):String {
		if (styleClass == null) return "<p>" + text + "</p>"
		return "<p class='" + styleClass + "'>" + text + "</p>"
	}
	
}
