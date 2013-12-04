package alts {

public class AltWindowProgressBase extends AltWindowBase implements ISwfEmbed{
    protected var progress_bar:AltProgressBar;

    public function AltWindowProgressBase(init_params:AltWindowParameters) {
        progress_bar = new AltProgressBar(progress_class);
        addChild(progress_bar);
        super(init_params);
    }


    override public function adjust_background():void {
        add_content_box(progress_bar);
        super.adjust_background();
    }


    override public function adjust_elements():void {
        super.adjust_elements();
        progress_bar.y = AltUtils.get_bottom_y(text_title) + LINE_MARGIN * 0.5;
        text_info.y = AltUtils.get_bottom_y(progress_bar) + LINE_MARGIN * 0.5;
    }

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
