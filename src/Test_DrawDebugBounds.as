package {
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import utils.MovieClipDebug;

import utils.Utils;

[SWF(width=800,height=800)]
public class Test_DrawDebugBounds extends Sprite {
    public function Test_DrawDebugBounds() {
        Utils.addConsole(stage);
        
        var a:Sprite = createSprite("a");
        var b:Sprite = createSprite("b");
        var c:Sprite = createSprite("c");
        var d:Sprite = createSprite("d");
        
        addChildAtRandomPosition(this, a);
        addChildAtRandomPosition(a, b);
        addChildAtRandomPosition(b, c);
        drawDebugBounds(a);
        addChildAtRandomPosition(c, d);
        
        var druggableMC:MovieClipDebug = new MovieClipDebug();
        druggableMC.addChild(Utils.createBox());
        druggableMC.addEventListener(MouseEvent.MOUSE_DOWN, mouseHandler);
        druggableMC.addEventListener(MouseEvent.MOUSE_UP, mouseHandler);
//        druggableMC.addEventListener(MovieClipDebug.MOVED, movedHandler);
        addChild(druggableMC);
        drawDebugBounds(druggableMC);
        druggableMC.x = 150;
        
    }
    
//    private function movedHandler(event:Event):void {
//        trace("moved");
//    }
    
    private function mouseHandler(event:MouseEvent):void {
        switch (event.type) {
            case MouseEvent.MOUSE_DOWN:
                (event.target as MovieClip).startDrag();
                break;
            case MouseEvent.MOUSE_UP:
                (event.target as MovieClip).stopDrag();
                break;
        }
    }
    
    private function addChildAtRandomPosition(par:Sprite, child:DisplayObject):void {
        child.x = Utils.getRandom(0, 50);
        child.y = Utils.getRandom(0, 50);
        par.addChild(child);
    }
    
    private function createSprite(spriteName:String):Sprite {
        var s:Sprite = new Sprite();
        s.x = Utils.getRandom(0, 50);
        s.y = Utils.getRandom(0, 50);
        s.name = spriteName;
        
        s.addChild(Utils.createBox());
        
        return s;
    }
    
    private function drawDebugBounds(d:DisplayObject):void {
        if(d.parent){
            var par:Sprite = Sprite(d.parent);
            var debugName:String = "debug_"+d.name;
        
            var debugBoundsSprite:Sprite = new Sprite();
            debugBoundsSprite.name = debugName;
            debugBoundsSprite.graphics.clear();
            debugBoundsSprite.graphics.beginFill(0x00FF00, 0.5);
            debugBoundsSprite.graphics.drawRect(d.x, d.y, d.width, Math.max(d.height, 1));
            debugBoundsSprite.graphics.endFill();
            debugBoundsSprite.mouseEnabled = false;
        
            var previousBounds:Sprite = Sprite(par.getChildByName(debugName));
            if(previousBounds){
                par.removeChild(previousBounds);
                previousBounds = null;
            }
        
            par.addChild(debugBoundsSprite);
    
            d.addEventListener(MovieClipDebug.MOVED, function (event:Event = null) {
                debugBoundsSprite.x = event.target.x;
                debugBoundsSprite.y = event.target.y;
            });
        }
    }
    
    
    
}
}
