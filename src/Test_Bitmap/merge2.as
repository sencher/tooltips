package Test_Bitmap {
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class merge2 extends Sprite{
        public function merge2(){

            var bmd1:BitmapData = new BitmapData(100, 80, true, 0xFF00FF00);
            var bmd2:BitmapData = new BitmapData(100, 80, true, 0xFFFF0000);
            var rect:Rectangle = new Rectangle(0, 0, 20, 20);
            var pt:Point = new Point(20, 20);
            var mult:uint = 0x80; // 50%
            bmd1.merge(bmd2, rect, pt, mult, mult, mult, mult);

            var bm1:Bitmap = new Bitmap(bmd1);
            addChild(bm1);
            var bm2:Bitmap = new Bitmap(bmd2);
            addChild(bm2);
            bm2.x = 110;
        }
    }
}
