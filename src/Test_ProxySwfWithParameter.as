package {
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.net.URLRequest;
    import flash.text.TextField;

    public class Test_ProxySwfWithParameter extends Sprite{
        public function Test_ProxySwfWithParameter() {
            var d:Date = new Date();
            var path:String = "InnerSwf.swf"+"?t="+String(d.time);
            trace(path);
            var tf:TextField = new TextField();
            tf.text = path;
            tf.width = 500;
            addChild(tf);
            var request:URLRequest = new URLRequest(path);
            var loader:Loader = new Loader()
            loader.load(request);
            addChild(loader);
        }
    }
}
