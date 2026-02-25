package wowp.utils.display.align
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import scaleform.clik.utils.Constraints;
	
	import wowp.utils.display.bottom;
	import wowp.utils.display.right;
	
	public class RelativeAlign
	{
		private var _mcSize:Sprite;
		private const items:Vector.<Element> = new <Element>[];
		
		public function RelativeAlign() {
		}
		
		public function getSize():Sprite{
			return _mcSize;
		}
		
		public function setSize(mcSize:Sprite):void {
			_mcSize = mcSize;
			draw();
		}
		
		public function addItem(item:DisplayObject, edges:uint):void {
			var element:Element = new Element();
			element.d = item;
			element.edges = edges;
			if ((edges & Constraints.LEFT) > 0) {
				element.horizontal = item.x - _mcSize.x;
			}
			if ((edges & Constraints.TOP) > 0) {
				element.vertical = item.y - _mcSize.y;
			}
			if ((edges & Constraints.RIGHT) > 0) {
				element.horizontal = right(_mcSize) - right(item);
			}
			if ((edges & Constraints.BOTTOM) > 0) {
				element.vertical = bottom(_mcSize) - bottom(item);
			}
			if ((edges & Constraints.CENTER_H) > 0) {
				element.horizontal = _mcSize.x + _mcSize.width / 2 - item.x - item.width / 2;
			}
			if ((edges & Constraints.CENTER_V) > 0) {
				element.vertical = _mcSize.y + _mcSize.height / 2 - item.y - item.height / 2;
			}
			items.push(element);
		}
		
		public function addItemCustomIndent(item:DisplayObject, edges:uint, vertical:Number, horizontal:Number):void {
			var element:Element = new Element();
			element.d = item;
			element.edges = edges;
			element.vertical = vertical;
			element.horizontal = horizontal;
			items.push(element);
		}
		
		public function draw():void {
			var len:int = items.length;
			for (var i:int = 0; i < len; ++i) {
				align(items[i]);
			}
		}
		
		private function align(element:Element):void {
			var edges:uint = element.edges;
			var item:DisplayObject = element.d;
			if ((edges & Constraints.LEFT) > 0) {
				item.x = Math.round(element.horizontal + _mcSize.x);
			}
			if ((edges & Constraints.TOP) > 0) {
				item.y = Math.round(element.vertical + _mcSize.y);
			}
			if ((edges & Constraints.RIGHT) > 0) {
				item.x = Math.round(right(_mcSize) - element.horizontal - item.width);
			}
			if ((edges & Constraints.BOTTOM) > 0) {
				item.y = Math.round(bottom(_mcSize) - element.vertical - item.height);
			}
			if ((edges & Constraints.CENTER_H) > 0) {
				item.x = Math.round(_mcSize.x + _mcSize.width / 2 - item.width / 2 - element.horizontal);
			}
			if ((edges & Constraints.CENTER_V) > 0) {
				item.y = Math.round(_mcSize.y + _mcSize.height / 2 - item.height / 2 - element.vertical);
			}
		}
		
		public function updateItem(d:DisplayObject):void {
			var len:int = items.length;
			for (var i:int = 0; i < len; ++i) {
				if (items[i].d == d) {
					align(items[i]);
					return;
				}
			}
		}
	}
}

import flash.display.DisplayObject;

class Element
{
	public var d:DisplayObject;
	public var edges:uint;
	public var horizontal:Number;
	public var vertical:Number;
	
}
