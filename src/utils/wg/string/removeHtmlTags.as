package utils.wg.string{	public function removeHtmlTags(value:String):String {		return value.replace(new RegExp("<[^>]*>","ig"), "");	}}