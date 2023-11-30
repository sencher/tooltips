package utils.wg.display.text.hangarImageSubstitution
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	import wowp.utils.array.getFieldArray;
	
	import wowp.utils.array.safeSplice;
	
	import wowp.utils.display.safeRemove;
	import wowp.utils.display.text.hangarImageSubstitution.icons.CurrencyDiscountIcon;
	import wowp.utils.display.text.hangarImageSubstitution.icons.ISubIcon;
	import wowp.utils.domain.createObject;
	import wowp.utils.string.nbsp;
	
	public class ImageSubstitutor
	{
		private static const space:String = nbsp();
		
		private static const _defaults:Array = [
				CurrencyDiscountIcon
		];
		
		private const _custom:Vector.<ISubIcon> = new Vector.<ISubIcon>();
		private const _subs:Vector.<ImgSubs> = new Vector.<ImgSubs>();
		
		public function setCustomSubstitution(sub:ISubIcon):void {
			_custom.push(sub);
		}
		
		public function substitute(textField:TextField):Array
		{
			dispose(textField);
			if (textField != null && textField.parent != null)
			{
				var html:String = textField.htmlText;
				
				if (html.indexOf("{") == -1) return [];
				
				textField.htmlText = space;
				var spaceBounds:Rectangle = textField.getCharBoundaries(0);
				
				textField.htmlText = html;
				
				var s:ImgSubs;
				var i:int;
				var sub:ISubIcon;
				var image:DisplayObject;
				var subs:Array = [];
				
				for each (var itemClass:Class in _defaults) {
					var isCustom:Boolean = false;
					for each (var subInst:ISubIcon in _custom) {
						if (subInst is itemClass) {
							isCustom = true;
							break;
						}
					}
					if (!isCustom) {
						_custom.push(new itemClass());
					}
				}
				
				for each (sub in _custom)
				{
					i = html.indexOf(sub.substring);
					
					while (i != -1)
					{
						image = createImage(sub.image);
						var num:int = sub.bounds.width / spaceBounds.width + 1;
						
						s = new ImgSubs();
						s.image = image;
						s.tfName = textField.name;
						s.bounds = sub.bounds;
						s.spaces = num;
						s.pos = textField.text.indexOf(sub.substring);
						subs.push(s);
						_subs.push(s);
						
						var repl:String = "";
						while (num-- > 0)
						{
							repl += space;
						}
						
						html = html.substr(0, i) + repl + html.substr(i + sub.substring.length);

						textField.htmlText = html;
						i = html.indexOf(sub.substring);
					}
				}
				
				for each(s in subs)
				{
					var b:Rectangle = textField.getCharBoundaries(s.pos);
					s.image.x = Math.round(textField.x + b.x - s.bounds.x);
					s.image.y = Math.round(textField.y + b.bottom - s.image.height + s.bounds.y);
					textField.parent.addChildAt(s.image, textField.parent.getChildIndex(textField));
				}
			}
			return getFieldArray(subs, "image");
		}
		
		public function dispose(tf:TextField=null):void {
			var subs:Vector.<ImgSubs> = _subs.slice();
			while (subs.length) {
				var sub:ImgSubs = subs.pop();
				if (!tf || sub.tfName == tf.name) {
						safeRemove(sub.image);
						safeSplice(_subs, sub);
					}
			}
		}
		
		private function createImage(image:String):DisplayObject
		{
			var obj:Object = createObject(image);
			if (obj is BitmapData) {
				return new Bitmap(obj as BitmapData);
			} else if (obj is DisplayObject) {
				return obj as DisplayObject;
			}
			return null;
		}
	}

}

import flash.display.DisplayObject;
import flash.geom.Rectangle;

class ImgSubs
{
	public var pos:int;
	public var bounds:Rectangle;
	public var spaces:int;
	public var image:DisplayObject;
	public var tfName:String;
}