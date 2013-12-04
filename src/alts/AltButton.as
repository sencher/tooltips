package alts {

    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    public class AltButton extends MovieClip {
        public static const CLICKED:String = "clicked";

        private const ROLL_OUT:int = 1;
        private const ROLL_OVER:int = 2;
        private const DISABLED:int = 4;

        private var _movie:MovieClip;
        private var _callback:Function;
        private var _labelText:String;

        public function AltButton(buttonClass:*, callback:Function) {
            _movie = new buttonClass();
            if (callback != null) {
                _callback = callback;
                changeFrame(ROLL_OUT);
                _movie.addEventListener(MouseEvent.MOUSE_DOWN, movie_mouseDownHandler);
                _movie.addEventListener(MouseEvent.MOUSE_OVER, movie_rollOverHandler);
                _movie.addEventListener(MouseEvent.MOUSE_OUT, movie_rollOutHandler);
            } else {
                enabled = false;
                changeFrame(DISABLED);
            }
            addChild(_movie);
        }

        public function setLabel(value:String):void {
            if (value != null) {
                var tf:TextField = _movie.TextButton;
//                I18nHelper.set_font_for_display_object(tf);
                tf.text = _labelText = value;
            }
        }

        private function movie_rollOverHandler(event:MouseEvent):void {
            changeFrame(ROLL_OVER);
            event.stopImmediatePropagation();
        }

        private function movie_mouseDownHandler(event:MouseEvent):void {
            _callback.call();
            event.stopImmediatePropagation();
        }

        private function movie_rollOutHandler(event:MouseEvent):void {
            changeFrame(ROLL_OUT);
            event.stopImmediatePropagation();
        }

        public function dispose():void {
            if (_movie && _movie.hasEventListener(MouseEvent.MOUSE_DOWN)) {
                _movie.removeEventListener(MouseEvent.MOUSE_DOWN, movie_mouseDownHandler);
                _movie.removeEventListener(MouseEvent.MOUSE_UP, movie_rollOverHandler);
                removeChild(_movie);
                _movie = null;
            }
        }

        public function changeFrame(frame:int):void {
            _movie.gotoAndStop(frame);
            setLabel(_labelText);
        }
    }
}
