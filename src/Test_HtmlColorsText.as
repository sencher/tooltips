package {
	import flash.display.Sprite;
	import flash.text.TextField;

import utils.Utils;

public class Test_HtmlColorsText extends Sprite {
		public function Test_HtmlColorsText() {
			var t:TextField  = new TextField();
            t.width = stage.stageWidth;
			var s:String = '<font color=#0000ff>BLUE</font><font color="#00ff00">GREEN</font>';
            Utils.updateLabel(t, s, true);

			//t.htmlText = s;
			trace()
			addChild(t);

//            Utils.updateLabel(textField, text == null ? "" : text);
//            if (htmlEnabled) {
//                UIUtils.updateLabel(textField, text == null ? "" : text, true);
		}
	}
}
