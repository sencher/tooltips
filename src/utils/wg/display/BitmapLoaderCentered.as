package utils.wg.display
{
	public class BitmapLoaderCentered extends BitmapLoader
	{
		public override function get isCentered():Boolean {return true;}

		public override function set isCentered(value:Boolean):void {}


		public function BitmapLoaderCentered() {
			_isCentered=true;
		}
	}
}
