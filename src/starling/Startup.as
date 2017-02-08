package starling
{
    
    import com.junkbyte.console.Cc;
    
    import flash.display.Sprite;
    import flash.display.Stage;
    
    import starling.core.Starling;

    [SWF(width="1000", height="800", frameRate="60", backgroundColor="#ffffff")]
    public class Startup extends Sprite
    {
        private var _starling:Starling;
        
        public static var flashStage:Stage;

        public function Startup()
        {
//            Cc.start(this);
//            Cc.visible = true;
            
            flashStage = stage;
            _starling = new Starling(Game, stage);
            _starling.start();
        }
    }
}
