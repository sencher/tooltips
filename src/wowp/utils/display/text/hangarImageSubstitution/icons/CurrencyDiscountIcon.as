package wowp.utils.display.text.hangarImageSubstitution.icons
{
	import flash.geom.Rectangle;
	
	public dynamic class CurrencyDiscountIcon implements ISubIcon
	{
		public static const SUB:String = "{discount.g}";
		private var _bounds:Rectangle = new Rectangle(54, 15, 18, 20);
		private var _image:String = "iconComCurrencyDiscount";
		
		public function CurrencyDiscountIcon(bounds:Rectangle=null):void {
			if (bounds) {
				_bounds = bounds;
			}
		}
		
		public function get substring():String {
			return SUB;
		}
		
		public function get bounds():Rectangle {
			return _bounds;
		}
		
		public function get image():String {
			return _image;
		}
	}
}