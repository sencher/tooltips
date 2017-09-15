package {
	import com.junkbyte.console.Cc;
	
	import flash.display.Sprite;
	
	//Regexp.txt
	[SWF(width="500",height="800")]
	public class Test_AddLogToAllMethods extends Sprite {
		public function Test_AddLogToAllMethods() {
//Cc.logch(this, "Test_AddLogToAllMethods", arguments);
			Cc.start(this);
			Cc.height = 800;
			Cc.width = 500;
			first(3);
		}
		
		public function first(value:int)
		{
//Cc.logchh(this, "first", arguments);
			second(new Sprite());
		}
		
		public function second(o:*) {
//Cc.logchh(this, "second", arguments);
			third();
		}
		
		public function third() {
//Cc.logchw(this, 3, "third", arguments);
			f4();
		}
	
	private function f4():void {
		f5("sdadsa");
	}
	
	private function f5(s:String):void {
		
		f6({name:"Fraer", skill:96});
	}
	
	private function f6(o:*):void {
		Cc.logchw(this, "f6", arguments);
		f7();
	}
	
	private function f7():void {
		//Cc.logchw(this, 9, "f7", arguments);
	}
	}
}
