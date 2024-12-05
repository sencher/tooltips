package {

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import wowp.utils.display.safeRemoveChild;

public class Test_AddedVsAddedToStage extends BaseTest {
    private const container:Sprite = new Sprite();
    private const child:Sprite = new Sprite();
    
    public function Test_AddedVsAddedToStage() {
        child.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
        child.addEventListener(Event.ADDED, added);
        
        addEventListener(KeyboardEvent.KEY_UP, keyUp);
    }
    
    private function keyUp(event:KeyboardEvent):void {
        switch (event.keyCode) {
            case Keyboard.NUMBER_1:
                container.addChild(child);
                break;
            case Keyboard.NUMBER_2:
                safeRemoveChild(container, child);
                break;
            case Keyboard.NUMBER_3:
                addChild(container);
                break;
            case Keyboard.NUMBER_4:
                safeRemoveChild(this, container);
                break;
            case Keyboard.NUMBER_5:
                addChild(child);
                break;
            case Keyboard.NUMBER_6:
                safeRemoveChild(this, child);
                break;
            
        }
    }
    
    private function added(event:Event):void {
        log("added parent:", event.target.parent);
    }
    
    private function addedToStage(event:Event):void {
        log("addedToStage parent:", event.target.parent);
    }
}
}
