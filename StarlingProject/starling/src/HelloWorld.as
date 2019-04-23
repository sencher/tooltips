package
{
import flash.display.Sprite;
import starling.core.Starling;

[SWF(width="400", height="300", frameRate="60", backgroundColor="#808080")]
public class HelloWorld extends Sprite
{
    private var _starling:Starling;

    public function HelloWorld()
    {
        _starling = new Starling(Game, stage);
        _starling.start();
    }
}
}