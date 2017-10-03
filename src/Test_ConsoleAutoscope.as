package {
	import com.junkbyte.console.Cc;
	
	import flash.display.Sprite;
	
	[SWF(height=600,width=500)]
	public class Test_ConsoleAutoscope extends Sprite {
		public function Test_ConsoleAutoscope() {
			Cc.start(this);
			Cc.visible = true;
			Cc.height = 600;
			Cc.width = 500;
			Cc.config.commandLineAutoScope = true;
		}
	}
}

class
