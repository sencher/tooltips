package {

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

import utils.Utils;

import wowp.utils.display.bottom;
import wowp.utils.display.right;

public class Test_TabEnabled extends BaseTest {
    private var group1:Sprite = new Sprite();
    private var group2:Sprite = new Sprite();
    private const FIRST_Y:int = 75;
    
    public function Test_TabEnabled() {
        stage.addEventListener(KeyboardEvent.KEY_UP, stageKeyUpHandler);

        
        var a1 = Utils.createButton();
        a1.y = FIRST_Y;
        var a2 = Utils.createButton();
        a2.y = bottom(a1);
        var a3 = Utils.createButton();
        a3.y = bottom(a2);
        
        var b1 = Utils.createButton();
        b1.y = FIRST_Y;
        var b2 = Utils.createButton();
        b2.y = bottom(b1);
        var b3 = Utils.createButton();
        b3.y = bottom(b2);
        b1.x = b2.x = b3.x = right(a1);
        
        a1.tabEnabled = a2.tabEnabled = a3.tabEnabled = b1.tabEnabled = b2.tabEnabled = b3.tabEnabled = true;
        a1.buttonMode = a2.buttonMode = a3.buttonMode = b1.buttonMode = b2.buttonMode = b3.buttonMode = true;
        
        a1.addEventListener(Event.TAB_CHILDREN_CHANGE, tabChildrenChangeHandler);
        a1.addEventListener(MouseEvent.CLICK, clickHandler);
        a1.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
//        b1.addEventListener(Event.TAB_CHILDREN_CHANGE, tabChildrenChangeHandler);
//        b1.addEventListener(MouseEvent.CLICK, clickHandler);
//        b1.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
    
        group1.addChild(a1);
        group1.addChild(a2);
        group1.addChild(a3);  
        
        group2.addChild(b1);
        group2.addChild(b2);
        group2.addChild(b3);
        
        addChild(group1);
        addChild(group2);
        
        log(2313213213);
        
    }
    
    private function stageKeyUpHandler(event:KeyboardEvent):void {
        switch (event.keyCode) {
            case Keyboard.NUMBER_1:
                group1.tabChildren = !group1.tabChildren;
                break;
            case Keyboard.NUMBER_2:
                group2.tabChildren = !group2.tabChildren;
                break;
        }
    }
    
    private function tabChildrenChangeHandler(event:Event):void {
        trace("tabChildrenChangeHandler");
    }
    
    private function clickHandler(MouseEvent:Event):void {
        trace("clickHandler");
    }
    
    private function keyUpHandler(event:KeyboardEvent):void {
        trace("keyUpHandler", event.keyCode);
    }
}
}
