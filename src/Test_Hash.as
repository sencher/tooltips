package {
    import flash.display.MovieClip;
    import flash.display.Sprite;

    import utils.Hash;


    public class Test_Hash extends Sprite{
        public function Test_Hash() {
            var h2:Hash = new Hash();
            var mc1:MovieClip = new MovieClip();
            var mc2:MovieClip = new MovieClip();
            var mc3:MovieClip = new MovieClip();
            var mc4:MovieClip = new MovieClip();

            mc1.name = "mc1";
            mc2.name = "mc2";
            mc3.name = "mc3";
            mc4.name = "mc4";

            h2.setKeyIfEmpty(mc1,mc3)
            h2.setKeyIfEmpty(mc2,mc4)
            trace(h2.getKey(mc1).name)
        }
    }
}
