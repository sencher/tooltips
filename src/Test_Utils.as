package {
    import flash.display.Bitmap;
    import flash.display.MovieClip;
    import flash.display.Sprite;

    import utils.MovieClipUtils;
import utils.Utils;

public class Test_Utils extends Sprite{
        public function Test_Utils() {
            var mc1:MovieClip = new MovieClip();
            var mc2:MovieClip = new MovieClip();
            var mc3:MovieClip = new MovieClip();
            var mc4:MovieClip = new MovieClip();
            mc1.name = "1";
            mc2.name = "2";
            mc3.name = "3";
            mc4.name = "4";

            var bitmap:Bitmap = new Bitmap();

            stage.addChild(mc1);
            mc1.addChild(mc2);
            mc2.addChild(mc3);
            mc3.addChild(mc4);
            mc4.addChild(bitmap);

            mc3.visible = false;

//            trace(MovieClipUtils.isVisible(mc1))
//            trace(MovieClipUtils.isVisible(mc2))
//            trace(MovieClipUtils.isVisible(mc3))
//            trace(MovieClipUtils.isVisible(mc4))

            var s:String = "1";
            trace(s, MovieClipUtils.findMovieClipsByName(mc1,s));
            var s:String = "2";
            trace(s, MovieClipUtils.findMovieClipsByName(mc1,s));
            var s:String = "3";
            trace(s, MovieClipUtils.findMovieClipsByName(mc1,s));
            var s:String = "4";
            trace(s, MovieClipUtils.findMovieClipsByName(mc1,s));
            var s:String = "5";
            trace(s, MovieClipUtils.findMovieClipsByName(mc1,s));


            trace(Utils.generateRandomString(12));
            trace(Utils.generateRandomString(3));
            trace(Utils.generateRandomString(5));
            trace(Utils.generateRandomString(7));
        }
    }
}
