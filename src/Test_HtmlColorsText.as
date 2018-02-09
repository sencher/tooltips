package {
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Test_HtmlColorsText extends Sprite {
		public function Test_HtmlColorsText() {
			var t:TextField  = new TextField();
            t.width = stage.stageWidth;
			var s:String = '<font color=#0000ff>BLUE</font><font color="#00ff00">GREEN</font>';
            t.text = s;

			//t.htmlText = s;
			trace()
			addChild(t);
		}
	}
}
