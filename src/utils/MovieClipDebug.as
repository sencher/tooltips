package utils {
import flash.display.MovieClip;
import flash.events.Event;
import flash.geom.Rectangle;

public class MovieClipDebug extends MovieClip
{
    public static const MOVED:String = "moved";
    
    override public function set x( n:Number ):void
    {
        super.x = n;
        this.dispatchEvent( new Event( MovieClipDebug.MOVED ) );
    }
    
    override public function set y( n:Number ):void
    {
        super.y = n;
        this.dispatchEvent( new Event( MovieClipDebug.MOVED ) );
    }
    
    override public function startDrag(lockCenter:Boolean = false, bounds:flash.geom.Rectangle = null):void {
        super.startDrag(lockCenter, bounds);
    }
    
    override public function stopDrag():void {
        super.stopDrag();
        this.dispatchEvent( new Event( MovieClipDebug.MOVED ) );
    }
}
}
