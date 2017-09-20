package {
	import display.MovieClipWithEvents2;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import utils.Utils;
	
	public class Test_VisibleEvent2 extends Sprite {
		private var mc1:MovieClip;
		private var mc2:MovieClip;
		private var mc3:MovieClip;
		private var mc4:MovieClipWithEvents2;
		public function Test_VisibleEvent2() {
			mc1 = new MovieClip();
			mc2 = new MovieClip();
			mc3 = new MovieClip();
			mc4 = new MovieClipWithEvents2();
			
			mc1.name = "mc1";
			mc2.name = "mc2";
			mc3.name = "mc3";
			mc4.name = "mc4";
			
			addChild(mc1);
			mc1.addChild(mc2);
			mc2.addChild(mc3);
			mc3.addChild(mc4);
			
			removeChild(mc1);
			trace("*************\n" + Utils.globalVisibleList(mc4));
			
		}
	}
}