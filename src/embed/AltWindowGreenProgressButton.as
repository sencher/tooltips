/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 28.06.13
 * Time: 13:18
 * To change this template use File | Settings | File Templates.
 */
package embed {
public class AltWindowGreenProgressButton extends AltWindowProgressBase {

    [Embed(source="../swf/bubble_3d.swf", symbol="green_progress_clock")]
    public var green_progress_clock:Class;

    [Embed(source="../swf/bubble_3d.swf", symbol="green_button_with_icon")]
    public var green_button_with_icon:Class;

    private var button:*;

    public function AltWindowGreenProgressButton(init_params:AltWindowParameters) {
        button = new AltButton(green_button_with_icon, init_params.callback);
        addChild(button);
        super(init_params);
    }

    override public function get progress_class():*
    {
        return green_progress_clock;
    }

    override public function adjust_background():void {
        super.adjust_background();
    }

    override public function adjust_elements():void {
        super.adjust_elements();
    }
}
}
