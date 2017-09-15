package air {
import flash.display.Sprite;
import flash.text.TextField;

public class AirChild extends Sprite {
	private var tf:TextField = new TextField();
	
	public function AirChild() {
		tf.text = "Second";
		tf.multiline = true;
		tf.wordWrap = true;
		tf.border = true;
		addChild(tf);
	}
}
}
