package utils.wg.display.text.substitution
{

import com.junkbyte.console.Cc;

import flash.display.BitmapData;
	import flash.text.TextField;
	
	import scaleform.gfx.TextFieldEx;
	
	import wowp.utils.Utils;
	
	import wowp.utils.string.nbsp;
	
	import wowp.utils.string.size;
	
	import wowp.utils.string.stringReplace;
	
	//	This processor looks for particular substrings in the textfield's text, replaces them by previously registered images
	//	todo: would be nice to have this feature implemented inside the scaleform's guts
	public class ImageSubstitutionsProcessor
	{
		private static const _icons:Object = {};
		
		private static const TAG_OPEN:String = "{";
		private static const TAG_CLOSE:String = "}";
		
		public static function getSubstring(s:String):String {return TAG_OPEN + s + TAG_CLOSE;}
		
		public static function registerIcon(icon:Object, substring:String=null):void {
			if (icon.subString.length > 15) {
				var trunc:String = TAG_OPEN + (icon.subString as String).substr(1, 13) + TAG_CLOSE;
				trace("[ImageSubstitutionsProcessor] registerIcon(): substring '" + icon.subString + "' too long. Truncated to '" + trunc + "'");
				icon.subString = trunc;
			}
			trace("[ImageSubstitutionsProcessor] registerIcon():", icon, substring);
			if (!substring) substring = icon.subString;
			_icons[substring] = icon;
		}
		
		public static function dispose():void {
			for (var s:String in _icons) {
				delete _icons[s];
			}
		}
		
		public static function process(tf:TextField):void {
			if (tf == null) return;
			var keys:Array = extractKeys(tf.text);
			var len:int = keys.length;
			for (var i:int = 0; i < len; i++) {
				var o:Object = _icons[keys[i]];
				if (o) {
					tf.htmlText = stringReplace(tf.htmlText, keys[i], o.subString);
					TextFieldEx.setImageSubstitutions(tf, o);
				}
			}
		}
		
		public static function processWithSpaces(tf:TextField):void {
			if (tf == null) return;
			var keys:Array = extractKeys(tf.text);
			var len:int = keys.length;
			for (var i:int = 0; i < len; i++) {
				var o:Object = _icons[keys[i]];
				if (o) {
					var bitmapData:BitmapData = o.image as BitmapData;
//					Cc.logcw("ImageSubstitutionsProcessor", "processWithSpaces", tf, keys, o, bitmapData);
					if(bitmapData) {
						tf.htmlText = stringReplace(tf.htmlText, keys[i], Utils.getSpaces(bitmapData.width));
					}else{
						trace("Error: ImageSubstitutionsProcessor bitmapData = null");
					}
				}
			}
		}
		
		private static function extractKeys(str:String):Array {
			var result:Array = [];
			var a:Array = str.split(TAG_OPEN);
			if (a.length != 1) {
				var len:int = a.length;
				for (var i:int = 0; i < len; i++) {
					var s:String = a[i];
					var b:Array = s.split(TAG_CLOSE);
					if (b.length > 1) {
						result.push(TAG_OPEN + b[0] + TAG_CLOSE);
					}
				}
			}
			return result;
		}
	}
}
