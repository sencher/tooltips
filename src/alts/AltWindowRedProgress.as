package alts {

public class AltWindowRedProgress extends AltWindowProgressBase implements ISwfEmbed{

    [Embed(source="../swf/bubble_3d.swf", symbol="red_progress")]
    public var red_progress:Class;

    public function AltWindowRedProgress(init_params:AltWindowParameters) {
        super(init_params);
    }

    override public function get progress_class():*
    {
        return red_progress;
    }
}
}
