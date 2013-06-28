package embed {

public class AltWindowGreenProgress extends AltWindowProgressBase {

    [Embed(source="../swf/bubble_3d.swf", symbol="green_progress")]
    public var green_progress:Class;

    public function AltWindowGreenProgress(init_params:AltWindowParameters) {
        super(init_params);
    }

    override public function get progress_class():*
    {
        return green_progress;
    }
}
}
