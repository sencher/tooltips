package utils.wg.display
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	import flash.text.TextField;

	import scaleform.clik.utils.Padding;

	/**
	 * вычисляет паддинги для _background относительно чайлдов container и ресайзит _background так, чтобы падинги сохранились
	 * можно использовать в тех местах, где нужно обеспечить падинги выставленные в флеше с помощью дисплейных объектов
	 */
	public class BackgroundWrappingHelper
	{
		private var _background:DisplayObject;
		private var _container:DisplayObjectContainer;
		
		private const _padding:Padding = new Padding();
		private var _skip:Array = [];

		/**
		 * background должен быть чайлдом container'a
		 * @param    background
		 * @param    container
		 */
		public function BackgroundWrappingHelper(background:DisplayObject, container:DisplayObjectContainer,
                                                 skip:Array = null)
		{
			_background = background;
			_container = container;
			if (skip)_skip = skip.slice();
			if (isValid()) {
				var contentBounds:Rectangle = findContentBounds();
				var bgBounds:Rectangle = _background.getBounds(_container);
				_padding.top = contentBounds.top - bgBounds.top;
				_padding.left = contentBounds.left - bgBounds.left;
				_padding.bottom = contentBounds.bottom - bgBounds.bottom;
				_padding.right = contentBounds.right - bgBounds.right;
			}
		}
		
		/**
		 * ресайз и позиционирование background с учетом баундинга контента и паддингов
		 * @param    horizontal    - изменять ли размеры по горизонтали
		 * @param    vertical    - изменять ли размеры по вертикали
		 */
		public function draw(horizontal:Boolean = true, vertical:Boolean = true, visibleOnly:Boolean = false):void
		{
			if (isValid()) {
				var contentBounds:Rectangle = findContentBounds(visibleOnly);
				var bgBounds:Rectangle = new Rectangle();
				bgBounds.top = contentBounds.top - _padding.top;
				bgBounds.left = contentBounds.left - _padding.left;
				bgBounds.bottom = contentBounds.bottom - _padding.bottom;
				bgBounds.right = contentBounds.right - _padding.right;
				//	FIXME:	здесь корректно будет работать только если у бекграунда будет точка отсчета слева вверху
				if (horizontal) {
					_background.x = int(bgBounds.x);
					_background.width = int(bgBounds.width);
				}
				if (vertical) {
					_background.y = int(bgBounds.y);
					_background.height = int(bgBounds.height);
				}
			}
		}
		
		private function findContentBounds(visibleOnly:Boolean = false):Rectangle
		{
			var contentBounds:Rectangle = new Rectangle(int.MAX_VALUE, int.MAX_VALUE, -uint.MAX_VALUE, -uint.MAX_VALUE);
			
			var i:int = 0;
			var len:int = _container.numChildren;
			for (i; i < len; ++i) {
				var displayObject:DisplayObject = _container.getChildAt(i);
				if (_skip.indexOf(displayObject) != -1) continue;
				if (displayObject == _background) continue;	//	пропускаем бекграунд
				if (!displayObject.visible && visibleOnly) continue;
				var bounds:Rectangle = displayObject.getBounds(_container);
				if (displayObject is TextField) {
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
			return _container.numChildren > 1 && _container == _background.parent;
		}

		public function addToExlude(...args):void {
			for each(var d:Object in args) {
				if (_skip.indexOf(d) == -1) {
					_skip.push(d);
				}
			}
		}

		public function removeFromExclude(...args):void {
			for each(var d:Object in args) {
				var index:int = _skip.indexOf(d);
				if (index != -1) {
					_skip.splice(index, 1);
				}
			}
		}

		public function updateSkipElements(...args:Array):void
		{
			_skip = args;
		}
		
		public function updateBackground(d:DisplayObject):void {
			_background = d;
		}
	}

}