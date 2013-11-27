package {
    import flash.display.MovieClip;
    import flash.display.Sprite;

    public class Test_OverrideVisible extends Sprite{
        public function Test_OverrideVisible() {
            var mc:MovieClip = new MovieClip();
            addChild(mc);
//            mc.visible = new function oo(value:Boolean):void {
//                trace("bla2")
//            };

            mc.visible = new function set visible(value:Boolean):void
            {

            }
            mc.visible = false;

        }

        public function ovVisible(value:Boolean):void{
            trace("bla")
        }
    }
}
