package {
	import com.junkbyte.console.Cc;

import flash.display.Sprite;

import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import utils.Utils;

[SWF(height=1000,width=400,backgroundColor="#333333")]
	public class Test_ConsoleAutoscope extends Sprite {
		public function Test_ConsoleAutoscope() {
			var bg:Sprite = Utils.createButton(0,0,stage.stageWidth,stage.stageHeight);
			addChild(bg);

			Cc.start(this);
//			Cc.visible = true;
			Cc.height = 600;
			Cc.width = 500;
			Cc.config.commandLineAutoScope = true;
			Cc.config.commandLineAllowed = true;
			for (var i:int=0;i<100;i++){
				Cc.log(i);
			}
//			stage.addEventListener(KeyboardEvent.KEY_DOWN, container_keyDownHandler)
//			stage.addEventListener(KeyboardEvent.KEY_UP, container_keyDownHandler)
			Cc.logch(Utils, "init");
		}

	private function container_keyDownHandler(event:KeyboardEvent):void {
		trace("3");
//		if(event.keyCode == Keyboard.QUOTE) {
//			visible = !visible;
//		}
	}
	}
}

//class
