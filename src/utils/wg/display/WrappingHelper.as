package utils.wg.display {
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;

	import scaleform.clik.utils.Padding;

	public class WrappingHelper {
		private var _wrapper:DisplayObject;
		private var _wrappee:DisplayObject;

		private const _padding:Padding = new Padding();

		public function WrappingHelper(wrapper:DisplayObject, wrappee:DisplayObject) {
			_wrapper = wrapper;
			_wrappee = wrappee;
			if(isValid()) {
				var wrapeeBounds:Rectangle = _wrappee.getBounds(_wrappee.parent);
				var wrapperBounds:Rectangle = _wrapper.getBounds(_wrapper.parent);
				_padding.top = wrapeeBounds.top - wrapperBounds.top;
				_padding.left = wrapeeBounds.left - wrapperBounds.left;
				_padding.bottom = wrapeeBounds.bottom - wrapperBounds.bottom;
				_padding.right = wrapeeBounds.right - wrapperBounds.right;
			}
		}
		
		public function setWrapper(d:DisplayObject):void {
			_wrapper = d;
		}
		
		public function draw(horizontal:Boolean = true, vertical:Boolean = true):void {
			if(isValid()) {
				var wrapeeBounds:Rectangle = _wrappee.getBounds(_wrappee.parent);
				var wrapperBounds:Rectangle = new Rectangle();
				wrapperBounds.top = wrapeeBounds.top - _padding.top;
				wrapperBounds.left = wrapeeBounds.left - _padding.left;
				wrapperBounds.bottom = wrapeeBounds.bottom - _padding.bottom;
				wrapperBounds.right = wrapeeBounds.right - _padding.right;
				//	FIXME:	здесь корректно будет работать только если у бекграунда будет точка отсчета слева вверху
				if(horizontal) {
					_wrapper.x = wrapperBounds.x;
					_wrapper.width = wrapperBounds.width;
				}
				if(vertical) {
					_wrapper.y = wrapperBounds.y;
					_wrapper.height = wrapperBounds.height;
				}
			}
		}

		public function isValid():Boolean {
			return _wrapper != _wrappee && _wrapper && _wrappee && _wrappee.parent != null && _wrapper.parent != null;
		}

		public function updateElements(wrapper:DisplayObject, wrappee:DisplayObject):void {
			_wrapper = wrapper;
			_wrappee = wrappee;
		}
	}

}