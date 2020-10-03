package {
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;

/*
    add SWC in
    Project Structure | Modules | [your module] | [your build configuration] | Dependencies tab
 */
public class Test_SwcUsage extends Sprite {
    
    private var icon:MovieClip;
    
    public function Test_SwcUsage() {
        icon = new TotalWarIcon_up();
        icon.x = icon.y = 250;
        addChild(icon);
        
        //frames started from 0
        icon.addFrameScript(1, frameFunction);
        icon.addEventListener(MouseEvent.CLICK, onClick)
    }
    
    private function onClick(event:MouseEvent):void {
        if (icon.currentFrame == icon.totalFrames) {
            icon.gotoAndStop(1);
        } else {
            icon.nextFrame();
        }

//        icon.play()
    }
    
    private function frameFunction():void {
        trace("Executing one time frameFunction for Frame 2");
        //delete frame script by passing null as second parameter
        icon.addFrameScript(1, null);
    }
}
}
