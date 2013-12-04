package utils {
    import flash.display.Sprite;
    import flash.text.TextField;

    public class InnerSwf extends Sprite{
        public function InnerSwf() {
            var message:String = "InnerSwf";
            trace(message);
            var tf:TextField = new TextField();
            tf.text = message;
            tf.y = 30;
            tf.width = 500;
            addChild(tf);
        }
    }
}
