package wowp.utils.display 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import scaleform.clik.utils.Padding;
	
	
	public class GroupWrappingHelper 
	{
		private var _background:DisplayObject;
		private var _group:Array;
		
		private const _padding:Padding = new Padding();
		
		public function GroupWrappingHelper(background:DisplayObject, group:Array) 
		{
			_background = background;
			_group = group;
			if (isValid())
			{
				var contentBounds:Rectangle = findContentBounds();
				var bgBounds:Rectangle = _background.getBounds(_background.parent);
				_padding.top = contentBounds.top - bgBounds.top;
				_padding.left = contentBounds.left - bgBounds.left;
				_padding.bottom = contentBounds.bottom - bgBounds.bottom;
				_padding.right = contentBounds.right - bgBounds.right;
			}
		}
		
		public function draw():void
		{
			if (isValid())
			{
				var contentBounds:Rectangle = findContentBounds();
				var bgBounds:Rectangle = new Rectangle();
				bgBounds.top = contentBounds.top - _padding.top;
				bgBounds.left = contentBounds.left - _padding.left;
				bgBounds.bottom = contentBounds.bottom - _padding.bottom;
				bgBounds.right = contentBounds.right - _padding.right;
				//	FIXME:	здесь корректно будет работать только если у бекграунда будет точка отсчета слева вверху
				_background.x = bgBounds.x;
				_background.y = bgBounds.y;
				_background.width = bgBounds.width;
				_background.height = bgBounds.height;
			}
		}
		
		private function findContentBounds():Rectangle
		{
			var contentBounds:Rectangle = new Rectangle(int.MAX_VALUE, int.MAX_VALUE,-uint.MAX_VALUE, -uint.MAX_VALUE);
			
			var i:int = 0;
			var len:int = _group.length;
			for (i; i < len; ++i)
			{
				var displayObject:DisplayObject = _group[i] as DisplayObject;
				if (displayObject.parent == null) continue;
				if (displayObject == _background) continue;	//	пропускаем бекграунд
				var bounds:Rectangle = displayObject.getBounds(displayObject.parent);
				if (displayObject is TextField)
				{
					bounds.left += 2;
					bounds.top += 2;
				}
				if (contentBounds.left > bounds.left)contentBounds.left = bounds.left;
				if (contentBounds.right < bounds.right)contentBounds.right = bounds.right;
				if (contentBounds.top > bounds.top) contentBounds.top = bounds.top;
				if (contentBounds.bottom < bounds.bottom) contentBounds.bottom = bounds.bottom;
			}
			return contentBounds;
		}
		
		public function isValid():Boolean
		{
			//	количество чайлдов должно быть больше одного, т.к. бекграунд тоже чайлд
			return _background.parent != null && _group.length > 0;
		}
		
	}

}