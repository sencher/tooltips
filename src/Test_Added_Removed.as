//Ex 76        http://flasher.ru/forum/showthread.php?t=85645&page=7

package {
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.utils.getTimer;

    public class Test_Added_Removed extends Sprite {
        private var sprite:Sprite = new Sprite();

        public function Test_Added_Removed() {
            sprite.addEventListener(Event.ADDED, addEnterFrame);
            sprite.addEventListener(Event.REMOVED, removeEnterFrame);
            // Добавляем/удаляем объект по клику мышки
            stage.addEventListener(MouseEvent.CLICK, addRemove);
        }

// Добавляем/удаляем обработчик события enter frame
        private function addEnterFrame(evt:Event):void {
            trace("added");
            sprite.addEventListener(Event.ENTER_FRAME, enterFrame);
        }

        private function removeEnterFrame(evt:Event):void {
            trace("removed");
            sprite.removeEventListener(Event.ENTER_FRAME, enterFrame);
        }

        private function enterFrame(evt:Event):void {
            trace("Time: " + getTimer());
        }


        private function addRemove(evt:Event):void {
            if (this.contains(sprite)) {
                this.removeChild(sprite);
            } else {
                this.addChild(sprite);
            }
        }
    }
}
