package  {
	
	import flash.display.MovieClip;
	
	
	public class Window extends MovieClip {
		
		public var row1:TextRow;
		public var row2:TextRow;
		public var row3:TextRow;
		
		public function Window() {
//			trace("wind cons");
//			trace(row1);
//			trace(row1.setTitle);
			row1.setTitle("Каждый");
			row1.setDescription("Охотник");
			row2.setTitle("Желает");
			row2.setDescription("Знать");
		}
	}
	
}
