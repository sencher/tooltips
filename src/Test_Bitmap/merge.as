package Test_Bitmap {
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class merge extends Sprite{
        public function merge() {
            var bitMapData1:BitmapData = new BitmapData(100,100); //or embedded item
            var bitMapData2:BitmapData = new BitmapData(100,100); // "

            var bitmap:Bitmap = new Bitmap(bitMapData1);
            this.addChild(bitmap);

            bitMapData1.merge(bitMapData2, new Rectangle(0, 0, 100, 100), new Point(0, 0), 128, 128, 128, 128);
        }
    }
}
