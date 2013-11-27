package {
    import flash.display.DisplayObject;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.MouseEvent;

    import visible.VisDisplayObject;

    public class Test_McWrapper extends Sprite{
        private var mc1:MovieClip = new MovieClip();

        public function Test_McWrapper() {

            addChild(mc1);
            mc1.name = "first MC";
            stage.addEventListener(MouseEvent.CLICK, onClick)
            patchMC(this);

        }

        private function onClick(event:MouseEvent):void {
            mc1.visible = !mc1.visible;
            trace(mc1.visible)
        }

        private function patchMC(sprite:Sprite):void
        {
            for (var i:int = 0; i < sprite.numChildren; i++)
            {
                var dObj:DisplayObject = sprite.getChildAt(i);
//                registerObject(dObj);
                sprite.removeChildAt(i);
                var vedo:VisDisplayObject = new VisDisplayObject(dObj);
                sprite.addChildAt(vedo, i);
                // register whatever listener you like with the vedo here
                vedo.addEventListener(VisDisplayObject.VISIBILITY_CHANGED, onVisibilityChanged)
            }
        }

        private function onVisibilityChanged(event:VisDisplayObject):void {
            trace("Changed");
        }
    }
}
