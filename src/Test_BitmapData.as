package {
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.filters.ColorMatrixFilter;
    import flash.geom.Matrix;
    import flash.geom.Matrix3D;
    import flash.geom.Point;
    import flash.geom.Rectangle;


    [SWF(width=800, height=300, backgroundColor=0x888888)]

    public class Test_BitmapData extends Sprite{
        private var m_bitmapData:BitmapData;
        private var mc_class:Class = Mc3;
        private var mc:MovieClip = new mc_class();

        public function Test_BitmapData() {
//            addChild(mc);

//            var red:Number = 1;//0.2225;
//            var green:Number = 1;//0.7169;
//            var blue:Number = 1;//0.0606;
//
//            var matrix:Array=   [red, green, blue, 0, 0,
//                red, green, blue, 0, 0,
//                red, green, blue, 0, 0,
//                0, 0, 0, 1, 0];
//            var cmf:ColorMatrixFilter = new ColorMatrixFilter();
//            cmf.matrix=matrix;
//            mc.filters=[cmf];

            m_bitmapData = new BitmapData(256, 256, true, 0);

            var movieSource:MovieClip = new mc_class;
            movieSource.x = 100;
            movieSource.y = 100;
            movieSource.alpha = 1;//0.4;
            addChild(movieSource);

            var m : Matrix = new Matrix();

            // stage.stageWidth = camera viewport width
            // m_bitmapData.width = cached texture size
            var scaleFactorX : Number = m_bitmapData.width / stage.stageWidth;
            var scaleFactorY : Number = m_bitmapData.height / stage.stageHeight;

            // move to real position of window shape
            m.translate(movieSource.x+0, movieSource.y);

            m.scale(scaleFactorX, scaleFactorY);


            m_bitmapData.draw(mc,m);
//            m_bitmapData.copyPixels(m_bitmapData,new Rectangle(0,0,50,50),new Point(50,50),null,);
            var bitmap:Bitmap = new Bitmap(m_bitmapData);
            bitmap.width = stage.stageWidth;
            bitmap.height = stage.stageHeight;
            bitmap.alpha = 1;//0.5;
            addChild(bitmap);


        }
    }
}
