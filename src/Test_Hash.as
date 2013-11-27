package {
    import flash.display.MovieClip;
    import flash.display.Sprite;

    import utils.Hash;


    public class Test_Hash extends Sprite{
        public function Test_Hash() {
            var h1:Hash = new Hash();
            var h2:Hash = new Hash();
            var mc1:MovieClip = new MovieClip();
            var mc2:MovieClip = new MovieClip();
            var mc3:MovieClip = new MovieClip();
            var mc4:MovieClip = new MovieClip();

            mc1.name = "mc1";
            mc2.name = "mc2";
            mc3.name = "mc3";
            mc4.name = "mc4";

            h1.setKeyIfEmpty(mc3,mc4)
            h1.setKeyIfEmpty(mc2,mc3)

            h2.setKeyIfEmpty(mc1,mc3)
            h2.setKeyIfEmpty(mc2,mc4)

//            trace(h2.getKey(mc1).name)

//            var i:*;
//            for (i in h2)
//            {
//                trace(i);
//            }
//            for each (i in h2)
//            {
//                trace(i);
//            }

            Hash.merge(h1, h2, true);

            tr(h1)


            var h3:Hash = new Hash();
            h3.setKeyIfEmpty(mc1,mc3);
            h3.setKeyIfEmpty(mc3,mc4);
            h3.setKeyIfEmpty(mc4,mc4);

trace("*****************")
            tr(h3)
trace("*****************")

            Hash.substract(h1, h3);
            tr(h1)
        }

        private function tr(h:Hash):void
        {
            for (var i:* in h)
            {
                trace(i.name + " , " + h.getKey(i).name);
            }
        }
    }
}
