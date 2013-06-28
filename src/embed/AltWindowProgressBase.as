/**
* Created with IntelliJ IDEA.
* User: User
* Date: 27.06.13
* Time: 20:12
* To change this template use File | Settings | File Templates.
*/
package embed {
import flash.display.MovieClip;

public class AltWindowProgressBase extends AltWindowBase {
    protected var progress_bar:AltProgressBar;

    public function AltWindowProgressBase(init_params:AltWindowParameters) {
        progress_bar = new AltProgressBar(progress_class);
        addChild(progress_bar);
        super(init_params);
    }


    override public function adjust_background():void {
//        width_array.push(progress_bar.width);
        add_content_box(progress_bar);
        super.adjust_background();
    }


    override public function adjust_elements():void {
        super.adjust_elements();
        progress_bar.y = text_title.y + text_title.height;
        text_info.y = progress_bar.y + progress_bar.height + LINE_MARGIN * 0.5;
    }

//    // should be overrided
//    public function get progress_movie():*
//    {
//        return null;
//    }

    // should be overrided
    public function get progress_class():*
    {
        return null;
    }

    public function set_progress(value:Number):void {
        progress_bar.set_progress(value);
    }
}
}
