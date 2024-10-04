package {

import com.greensock.TweenMax;

import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.ColorMatrixFilter;

[SWF(width="1400", height="1000")]
public class Dev_GrayscaleFilter extends BaseTest {
    private static const PATH:String = "box.png";
    private var mcBox:MovieClip = new MovieClip();
    private var mcBox2:MovieClip = new MovieClip();
    private var mcBox3:MovieClip = new MovieClip();
    
    public function Dev_GrayscaleFilter() {
        addChild(mcBox);
        addChild(mcBox2);
        addChild(mcBox3);
        load(PATH, onLoad);
        
        mcBox.addEventListener(MouseEvent.CLICK, clickHandler);
        mcBox2.addEventListener(MouseEvent.CLICK, clickHandler);
    }
    
    private function clickHandler(event:MouseEvent):void {
        var mc:MovieClip = MovieClip(event.target);
        //trace(mc);
        if(mc.filters.length > 0){
            mc["hiddenFilters"] = mc.filters.concat();
            mc.filters = [];
        }else if(mc["hiddenFilters"].length > 0){
            mc.filters = mc["hiddenFilters"];
        }
    }
    
    private function onLoad(event:Event = null):void {
        mcBox.addChild(event.target.content);
        
        //first way
        var f = new ColorMatrixFilter([
            0,0,0,0,0,
            0,0,0,0,0,
            0,0,0,0,0,
            -0.33,-0.33,-0.33,1,0
        ]);
        mcBox.filters = [f];
    
        load(PATH, onLoad2);
    }
    
    private function onLoad2(event:Event = null):void {
        mcBox2.addChild(event.target.content);
        mcBox2.x = mcBox.width;
        TweenMax.to(mcBox2, 0, {colorMatrixFilter:{saturation:-2}});
        //load(PATH, onLoad2);
    }
}
}
