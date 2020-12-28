package utils.wg.utils.display
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import scaleform.clik.utils.Padding;
	
	public class PaddingHelper 
	{
		private var _inner:Sprite;
		private var _outer:Sprite;
		
		public var padding:Padding = new Padding();
		
		public function PaddingHelper(inner:Sprite, outer:Sprite) 
		{
			if (inner.parent != null && outer.parent != null)
			{
				_inner = inner;
				_outer = outer;
				var contentBounds:Rectangle = _inner.getBounds(_inner.parent);
				var bgBounds:Rectangle = _outer.getBounds(_outer.parent);
				padding.top = contentBounds.top - bgBounds.top;
				padding.left = contentBounds.left - bgBounds.left;
				padding.bottom = contentBounds.bottom - bgBounds.bottom;
				padding.right = contentBounds.right - bgBounds.right;
			}
		}
		
		public function draw():void
		{
			if (_outer.parent == null) return;
			var contentBounds:Rectangle = _inner.getBounds(_inner.parent);
			var bgBounds:Rectangle = new Rectangle();
			bgBounds.top = contentBounds.top - padding.top;
			bgBounds.left = contentBounds.left - padding.left;
			bgBounds.bottom = contentBounds.bottom - padding.bottom;
			bgBounds.right = contentBounds.right - padding.right;
			//	FIXME:	здесь корректно будет работать только если у бекграунда будет точка отсчета слева вверху
			_outer.x = bgBounds.x;
			_outer.y = bgBounds.y;
			_outer.width = bgBounds.width;
			_outer.height = bgBounds.height;
		}
	}
}