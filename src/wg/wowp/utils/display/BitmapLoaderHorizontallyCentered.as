package wowp.utils.display
{
	public class BitmapLoaderHorizontallyCentered extends BitmapLoader
	{
		public function BitmapLoaderHorizontallyCentered() {
		}
		
		override protected function get _isHorizontallyCentered():Boolean {
			return true;
		}
		
		override protected function get _isVerticallyCentered():Boolean {
			return false;
		}
	}
}
