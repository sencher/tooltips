package air {
import flash.desktop.NativeProcess;
import flash.desktop.NativeProcessStartupInfo;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filesystem.File;
import flash.text.TextField;

import utils.Utils;

public class AirMain extends Sprite {
	private var tf:TextField = new TextField();
	private var button:Sprite = new Sprite();
	public function AirMain() {
		tf.text = "Main";
		tf.multiline = true;
		tf.wordWrap = true;
		tf.border = true;
		addChild(tf);
		
		var box:Shape = Utils.drawBox(100,100,200,200,0,0xffff00);
		box.name = "box";
		addChild(button);
		button.addChild(box);
		button.addEventListener(MouseEvent.CLICK, onClick)
	}
	
	private function onClick(event:MouseEvent):void {
		tf.appendText("c");
		if(NativeProcess.isSupported)
		{
			tf.appendText("+");
			var file:File = new File(File.applicationDirectory.nativePath).resolvePath('./../AirChild/AirChild.exe');
//			file = //file.resolvePath("./../")//\\AirChild\\AirChild.exe");
			trace(file.nativePath);

			var nativeProcessStartupInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();
			nativeProcessStartupInfo.executable = file;
			var process:NativeProcess = new NativeProcess();

			process.start(nativeProcessStartupInfo);
			
		}
	}
}
}
