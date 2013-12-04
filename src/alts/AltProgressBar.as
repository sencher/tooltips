package alts {
import flash.display.MovieClip;

public class AltProgressBar extends MovieClip{
    private var _movie:*;
    private var _progress_mask:MovieClip;
    private var _progress_max_width:Number;

    public function AltProgressBar(movie_clip:*) {
        _movie = new movie_clip();
        _progress_mask = progress_movie.progress_mask;
        _progress_max_width = _progress_mask.width;
        addChild(_movie);
    }

    public function get progress_movie():* {
        return _movie;
    }

    public function set_progress(value:Number):void {
        _progress_mask.width = _progress_max_width * value;
    }


}
}
