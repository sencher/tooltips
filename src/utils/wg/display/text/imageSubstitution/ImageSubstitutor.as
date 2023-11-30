package utils.wg.display.text.imageSubstitution
{

import utils.wg.utils.display.text.imageSubstitution.*;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextLineMetrics;
	
	public class ImageSubstitutor
	{
		private static const space:String = "<font size='12'> </font>";
		
		public static function substitute(textField:TextField, substitutions:Vector.<Substitution>, offsetX:int = 0, offsetY:int = 0):void
		{
			if (textField != null && textField.parent != null)
			{
				var html:String = textField.htmlText;
				
				textField.htmlText = space;
				var spaceBounds:Rectangle = textField.getCharBoundaries(0);
				
				textField.htmlText = html;
				
				var imgsubs:Array = [];
				var s:ImgSubs;
				
				var queue:Array = [];
				var i:int;
				var subs:Substitution;
				
				for each (subs in substitutions)
				{
					i = html.indexOf(subs.pattern);
					
					if (i != -1)
					{
						queue[i] = subs;
					}
				}
				
				for each (subs in queue)
				{
					i = html.indexOf(subs.pattern);

					while (i != -1)
					{
						var num:int = subs.image.width / spaceBounds.width + 1;
						
						s = new ImgSubs();
						s.img = subs.image;
						s.spaces = num;
						s.pos = textField.text.indexOf(subs.pattern);
						imgsubs[imgsubs.length] = s;
						
						var repl:String = "";
						while (num-- > 0)
						{
							repl += space;
						}
						
						html = html.substr(0, i) + repl + html.substr(i + subs.pattern.length);

						textField.htmlText = html;
						i = html.indexOf(subs.pattern);
					}
				}
				
				for each(s in imgsubs)
				{
					var b:Rectangle = textField.getCharBoundaries(s.pos);
					var metric:TextLineMetrics = textField.getLineMetrics(textField.getLineIndexOfChar(s.pos));
					s.img.x = Math.ceil(b.x + (s.spaces * spaceBounds.width - s.img.width) / 2) + offsetX;
					s.img.y = Math.ceil(textField.y + b.y + (metric.height - s.img.height) / 2) + offsetY;
					textField.parent.addChild(s.img);
				}
			}
		}
	
	}

}
import flash.display.DisplayObject;

class ImgSubs
{
	public var pos:int;
	public var img:DisplayObject;
	public var spaces:int;
}