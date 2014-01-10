package {
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;
    import flash.display.Sprite;

    [SWF(backgroundColor="0x333333")]
    public class Test_MultipleSwfEmbed extends Sprite{
        [Embed(source="swf/HintMenu.swf", symbol="ExternalMovie")]
        private var woodButtonClass:Class;

        [Embed(source="swf/HintMenu.swf", symbol="button_red")]
        private var redButtonClass:Class;

        [Embed(source="swf/HintMenu.swf", symbol="button_green")]
        private var greenButtonClass:Class;

        [Embed(source="swf/HintMenu.swf", symbol="bubble")]
        private var bubbleClass:Class;


        public function Test_MultipleSwfEmbed() {
//            addChild(new redButtonClass());
//            var g:MovieClip = new greenButtonClass();
//            g.y = 30;
//            addChild(g);
//            var bg:* = new bubbleClass();
//            bg.y = 60;
//            addChild(bg);

            //"is MovieClip" = true, when > 1 frame
            traceType(new woodButtonClass());
            traceType(new redButtonClass());
            traceType(new greenButtonClass());
            traceType(new bubbleClass());

        }

        private function traceType(mc:*):void {
            trace(mc is MovieClip, mc is Sprite, mc is DisplayObjectContainer);
        }
    }
}
