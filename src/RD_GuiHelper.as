package {
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import utils.EnergyButton;
    import utils.Utils;

    public class RD_GuiHelper extends Sprite{
        private var bclose1:close = new close();
        private var bclose2:close = new close();
        private var bclose3:close = new close();
        private var bbut1:but = new but();
        private var bbut2:but = new but();
        private var counter:int = 0;

        public function RD_GuiHelper() {
            initBut(bclose1)
//            bclose1.gotoAndStop(4);
            initBut(bclose2,false)
            initBut(bclose3)
//            GuiHelper4.enable(bclose3,false)

            initBut(bbut1);
            initBut(bbut2);

//            trace(generateRandomString(7));
//            trace(generateRandomString(7));
//            trace(generateRandomString(7));

        }

        private function initBut(mc:MovieClip,en:Boolean = true):void
        {
//            mc.addEventListener("a", frameChanged)//2
            addChild(mc);
            mc.y = counter * 50;
            mc.name = String(counter++);

            if(counter>1)
                EnergyButton.initButton(mc,Utils.trEvent,en);
            else
                EnergyButton.initButton(mc);

            mc.addEventListener(MouseEvent.RIGHT_CLICK, onRight)
            mc.addEventListener(MouseEvent.MIDDLE_CLICK, onMiddle)

        }

        private function onMiddle(event:MouseEvent):void {
            var curTarget:MovieClip = MovieClip(event.currentTarget);
            EnergyButton.setTextValue(curTarget, "text_label", generateRandomString(8));
            EnergyButton.setTextValue(curTarget, "text_value", generateRandomString(3));
        }

        private function onRight(event:MouseEvent):void {
            var curTarget:MovieClip = MovieClip(event.currentTarget);
            if(event.ctrlKey){
                if(curTarget.enabled)
                    EnergyButton.deactivateButton(curTarget);
                else
                    EnergyButton.initButton(curTarget);
            }else{
                EnergyButton.enable(curTarget, !curTarget.enabled);
            }
        }

        private static function frameChanged(event:Event):void {
            trace("frameChanged", event.target.currentFrame, event.currentTarget.name, event.currentTarget, event.target);
        }


        private function generateRandomString(strlen:Number):String{
            var chars:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var num_chars:Number = chars.length - 1;
            var randomChar:String = "";

            for (var i:Number = 0; i < strlen; i++){
                randomChar += chars.charAt(Math.floor(Math.random() * num_chars));
            }
            return randomChar;
        }
    }
}
