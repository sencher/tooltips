package {
    import flash.display.MovieClip;
    import flash.display.Sprite;

    [SWF(width=800, height=700,frameRate=30)]
    public class Test_Button extends Sprite{
        public function Test_Button() {
            var mc:MovieClip = new ExternalMovie();

            addChild(mc);

        }
    }
}
