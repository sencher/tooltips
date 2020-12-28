package utils.wg.utils.string
{
	/**
	 * Whether converts string "some text {colorTagOpen}coloredText{colorTagClose}"'"
	 * to "some text <font color='#color'>coloredText</font>"
	 * or just inserts colorTag into the font tag:
	 * "some text <font color='#colorTag'>coloredText</font>" = > "some text <font color='#color'>coloredText</font>"
	 *
	 * @param text - input text
	 * @param replace Dict {colorTag1: color1, colorTag2: color2}, color1 and color2 are of uint type
	 * @return
	 */
	public function colorize(text:String, replace:Object):String {
		var colorTag:String;
		var color:uint;
		var colorStr:String;
		if (replace == null)return text;
		if (text.indexOf("{") == -1) return text;
		for (colorTag in replace) {
			color = replace[colorTag];
			colorStr = color.toString(16);
			text = stringReplace(text, "{" + colorTag + "_Open}", "<font color='#" + colorStr + "'>");
			text = stringReplace(text, "{" + colorTag + "_Close}", "</font>");
			text = stringReplace(text, "#{" + colorTag + "}", "#" + colorStr);
		}
		return text;
	}
	
}
