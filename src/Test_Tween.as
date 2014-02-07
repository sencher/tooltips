package {
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.MouseEvent;

    import transitions.Tweener;

[SWF(frameRate="15")]
    public class Test_Tween extends Sprite{
        private static const TOOLS_DROP_DOWN_PANEL_TOP:int = 50;
        private static const STUFF_DROP_DOWN_PANEL_TOP:int = -73;
        private static const SETTINGS_DROP_DOWN_PANEL_TOP:int = -148;
        private static const PANELS_HIDE_Y:int = 150;

        private const TWEEN_UP:String = "tweenUp";
        private const TWEEN_DOWN:String = "tweenDown";
        private var mc:MovieClip;

        public function Test_Tween() {
            mc = new button_red();
            addChild(mc);
            stage.addEventListener(MouseEvent.CLICK, onclick)
            stage.addEventListener(MouseEvent.RIGHT_CLICK, onRclick)
        }

        private function onclick(event:MouseEvent):void {
            tween(mc, TWEEN_DOWN);
        }
        private function onRclick(event:MouseEvent):void {
            tween(mc, TWEEN_UP, TOOLS_DROP_DOWN_PANEL_TOP);
        }

        private function tween(mc:MovieClip, dimention:String, topPosition:int = 0):void
        {
            var targetAlpha:Number;

            if(dimention == TWEEN_UP){
                mc.visible = true;
                targetAlpha = 1;
                Tweener.addTween(mc, {y: topPosition, time: 0.8, transition: "easeOutBounce"});
            }else{
                targetAlpha = 0;
                Tweener.addTween(mc, {y: PANELS_HIDE_Y, time: 0.2, transition: "easeInCubic", onComplete: function ():void {
                    mc.visible = false;
                }});
            }
            Tweener.addTween(mc, {alpha: targetAlpha, time: 0.2, transition: "linear"});
        }
    }
}
