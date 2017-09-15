package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	//Search only SET visible of this level
	//Regex
	//[^."]visible[\s]*=
	//[^."]visible([0-9\sA-Z]{0,})=
	public class Test_TabSpaceSearch extends Sprite {
		private var mc:MovieClip;
		private var counter:int;
		public function Test_TabSpaceSearch() {
			mc = new MovieClip();
			mc.visible = true;
			this["mc"].visible = false;
			visible = true;
			 visible = true; visible = true;visible = true;
visible = false;
			 visible       = false;
			 visible	= false;
			 visible
					 = false;
			if(visible){
				trace("true");
			}
			(visible = true);
			func();
			
			trace("visible=");
			trace(" visible =");
			trace("visible  s   =");
			trace("\tvisible123=");
			trace("visibleSOMESHIT=");
			
		}
		
		public function func():void {
			var mc2 = new MovieClip();
			mc2.visible = false;
			visible= false;
			visible=false;
		}
		
		override public function set visible(value:Boolean):void {
			trace("visible", ++counter, value);
			super.visible = value;
		}
	}
}
