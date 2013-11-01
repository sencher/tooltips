package {
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.filters.ColorMatrixFilter;

    public class Test_BitmapData extends Sprite{
        private var m_bitmapData:BitmapData;
        private var mc_class:Class = Mc2;
        private var mc:MovieClip = new mc_class();

        public function Test_BitmapData() {
//            addChild(mc);

            var red:Number = 0.2225;
            var green:Number = 0.7169;
            var blue:Number = 0.0606;

            var matrix:Array=   [red, green, blue, 0, 0,
                red, green, blue, 0, 0,
                red, green, blue, 0, 0,
                0, 0, 0, 1, 0];
            var cmf:ColorMatrixFilter = new ColorMatrixFilter();
            cmf.matrix=matrix;
            mc.filters=[cmf];

            m_bitmapData = new BitmapData(mc.width, mc.height, true, 0);
            m_bitmapData.draw(mc);
            var bitmap:Bitmap = new Bitmap(m_bitmapData);
            addChild(bitmap)
        }
    }
}
