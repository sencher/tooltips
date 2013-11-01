package {
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.filters.BitmapFilter;
    import flash.filters.BitmapFilterQuality;
    import flash.filters.BlurFilter;

    public class Test_Blur extends Sprite {

        [Embed(source="images/game.PNG")]
        private var screenShotPng : Class;

        private var bgColor:uint = 0xFFCC00;
        private var size:uint    = 80;
        private var offset:uint  = 50;

        public function Test_Blur() {
            var image:Bitmap = new screenShotPng();
            addChild(image);
            draw();
            var filter:BitmapFilter = getBitmapFilter();
            var myFilters:Array = new Array();
            myFilters.push(filter);
            image.filters = myFilters;
        }

        private function getBitmapFilter():BitmapFilter {
            var blurX:Number = 15;
            var blurY:Number = 15;
            return new BlurFilter(blurX, blurY, BitmapFilterQuality.HIGH);
        }

        private function draw():void {

            graphics.beginFill(bgColor, 0.5);
            graphics.drawRect(offset, offset, size, size);
            graphics.endFill();
        }
    }
}