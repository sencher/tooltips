package embed {
import flash.display.MovieClip;
import flash.events.MouseEvent;

public class AltButton extends MovieClip{
    private const DEFAULT:int = 1;
    private const MOUSE_DOWN:int = 2;
    private const MOUSE_UP:int = 3;
    private const DISABLED:int = 4;

    private var _movie:MovieClip;
    private var _callback:Function;

    public function AltButton(movie_clip:*, callback:Function) {
        _movie = new movie_clip();
        if(callback != null){
            _callback = callback;
            _movie.gotoAndStop(DEFAULT);
            _movie.addEventListener(MouseEvent.MOUSE_DOWN, mouseEvent_mouseDownHandler);
            _movie.addEventListener(MouseEvent.MOUSE_UP, mouseEvent_mouseUpHandler);
        }else{
            enabled = false;
            _movie.gotoAndStop(DISABLED);
        }
        addChild(_movie);
    }

    private function mouseEvent_mouseUpHandler(event:MouseEvent):void {
        _movie.gotoAndStop(MOUSE_UP);
        _callback.call();
    }

    private function mouseEvent_mouseDownHandler(event:MouseEvent):void {
        _movie.gotoAndStop(MOUSE_DOWN);
    }

    public function get progress_movie():* {
        return _movie;
    }

    public function dispose():void {
        if(_movie && _movie.hasEventListener(MouseEvent.MOUSE_DOWN))
        {
            _movie.removeEventListener(MouseEvent.MOUSE_DOWN, mouseEvent_mouseDownHandler);
            _movie.removeEventListener(MouseEvent.MOUSE_UP, mouseEvent_mouseUpHandler);
            removeChild(_movie);
            _movie = null;
        }
    }
}
}
