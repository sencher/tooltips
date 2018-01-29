package {
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class App extends MovieClip {
		
		public static const FONT_NAME:String = "Brush Script Std Medium";
		public static const FONT_EXPORT_NAME:String = "FontBrushScript";
		public static const FONT_FILE_NAME:String = "font/BrushScript.swf";

		//ublic static const FONT_NAME:String = "Arial";
		//public static const FONT_EXPORT_NAME:String = "Arial33";
		//public static const FONT_FILE_NAME:String = "font/BrushScript.swf";

    	//public static const FONT_NAME:String = "VAGRounded BT";
    	//public static const FONT_EXPORT_NAME:String = "VAGRoundedBT";
		//public static const FONT_FILE_NAME:String = "font/font_to_swf.swf";
		

		function App():void {
            checkFonts()
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onFontLoaded);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onFontLoadingFailed);
			loader.addEventListener(IOErrorEvent.NETWORK_ERROR, onFontLoadingFailed);
			loader.addEventListener(IOErrorEvent.VERIFY_ERROR, onFontLoadingFailed);
			loader.addEventListener(IOErrorEvent.DISK_ERROR, onFontLoadingFailed);
			loader.load(new URLRequest(FONT_FILE_NAME));
			
		}
		private function onFontLoaded(e:Event):void {
			trace("Successfully loaded " + FONT_EXPORT_NAME + " (" + FONT_FILE_NAME + ")");
			if(e.target.applicationDomain.hasDefinition(FONT_EXPORT_NAME)) {
				var FontClass:Class = e.target.applicationDomain.getDefinition(FONT_EXPORT_NAME) as Class;					
				Font.registerFont(FontClass);
				addTextField();
			} else {
				trace("Missing " + FONT_EXPORT_NAME + "!");
			}
		}
		private function onFontLoadingFailed(e:IOErrorEvent):void {			
			trace("Missing " + FONT_FILE_NAME);
		}
		private function addTextField():void {
			trace("Adding text field ...");
            checkFonts()
			
			var format:TextFormat = new TextFormat();
			format.font = FONT_NAME;
			format.size = 45;
			format.color = 0x9f0000;
			format.bold = true;
			
			var field:TextField = new TextField();
			field.defaultTextFormat = format;
			field.border = true;
			field.text = "Embed font at runtime.";
			field.x = field.y = 35;
			field.embedFonts = true;
            field.rotation = 10;
			field.autoSize = TextFieldAutoSize.LEFT;
			
			addChild(field);
			
		}

        private function checkFonts():void {
            var allFonts:Array = Font.enumerateFonts(true);
            allFonts.sortOn("fontName", Array.CASEINSENSITIVE);

            var embeddedFonts:Array = Font.enumerateFonts(false);
            embeddedFonts.sortOn("fontName", Array.CASEINSENSITIVE);

            trace("allFonts", allFonts.length);
            trace("embeddedFonts", embeddedFonts.length);
			if(embeddedFonts.length){
				trace(embeddedFonts[0].fontName, embeddedFonts[0].fontStyle, embeddedFonts[0].fontType);
			}
        }
	}
}