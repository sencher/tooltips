package {
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Matrix;

    public class Test_BitmapDraw extends Sprite{
        public function Test_BitmapDraw() {
            var bmd1:BitmapData = new BitmapData(300,300,false,0x000000);
            var bmd2:BitmapData = new BitmapData(10,10,false,0xFFFFFF);
            var bmd3:BitmapData = new BitmapData(10,10,false,0xFFFFFF);
            var m:Matrix = new Matrix();
            m.translate(30,30);
            bmd1.draw(bmd2,m);
            m.translate(30,30);
            bmd1.draw(bmd3,m);

            var b1:Bitmap = new Bitmap(bmd1);
            addChild(b1)
            stage.addEventListener(Event.ENTER_FRAME, onEnterFrame)
        }

        private function onEnterFrame(event:Event):void {
            var bmd1:BitmapData = new BitmapData(300,300,false,0xFFFFFF);
            var bmd2:BitmapData = new BitmapData(10,10,false,0x000000);
            var bmd3:BitmapData = new BitmapData(10,10,false,0x000000);
            var m:Matrix = new Matrix();
            m.translate(30,30);
            bmd1.draw(bmd2,m);
            m.translate(30,30);
            bmd1.draw(bmd3,m);
            var b1:Bitmap = new Bitmap(bmd1);
        }
    }
}
