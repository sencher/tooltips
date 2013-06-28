package embed {
public class AltWindowGreenProgressButton extends AltWindowProgressBase implements ISwfEmbed{

    [Embed(source="../swf/bubble_3d.swf", symbol="green_progress_clock")]
    public var green_progress_clock:Class;

    [Embed(source="../swf/bubble_3d.swf", symbol="green_button_with_icon")]
    public var green_button_with_icon:Class;

    private var button:*;

    public function AltWindowGreenProgressButton(init_params:AltWindowParameters) {
        button = new AltButton(green_button_with_icon, init_params.callback);
        addChild(button);
        add_content_box(button);

        super(init_params);
    }

    override public function get progress_class():*
    {
        return green_progress_clock;
    }

    override public function adjust_background():void {
        bottom_margin += 6;
        super.adjust_background();
    }

    override public function adjust_elements():void {
        super.adjust_elements();
        button.y = AltUtils.get_bottom_y(progress_bar) + LINE_MARGIN * 0.5;
    }
}
}
