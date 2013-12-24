package {
    import flash.display.Sprite;

    public class Test_Trace extends Sprite{
        public function Test_Trace() {
            var s:Sprite = new Sprite();
//            trace(s)
            trace(this["s."]);
        }
    }
}
