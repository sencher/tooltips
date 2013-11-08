package {
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class Test_copPixels extends Sprite{
        public function Test_copPixels() {
            var bmd1:BitmapData = new BitmapData(40, 40, false, 0x000000FF);
            var bmd2:BitmapData = new BitmapData(80, 40, false, 0x0000CC44);

            var rect:Rectangle = new Rectangle(0, 0, 20, 20);
            var pt:Point = new Point(10, 10);
            bmd2.copyPixels(bmd1, rect, pt);

            var bm1:Bitmap = new Bitmap(bmd1);
            this.addChild(bm1);
            var bm2:Bitmap = new Bitmap(bmd2);
            this.addChild(bm2);
            bm2.x = 50;
        }
    }
}
