package  {
	
	import flash.display.MovieClip;
import flash.text.TextField;


public class TextRow extends MovieClip {
		public var txtTitle:TextField;
		public var txtDescription:TextField;
		
		public function TextRow() {
			// constructor code
		}
	
		public function setTitle(value:String):void{
			trace("setTitle", value);
			txtTitle.text = value;
		}
	
		public function setDescription(value:String):void{
			trace("setDescription", value);
			txtDescription.text = value;
		}
	}
	
}
