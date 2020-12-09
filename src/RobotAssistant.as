package {
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.ui.Keyboard;

import utils.Utils;

[SWF(width=1800, height=1000, backgroundColor="#999999")]
public class RobotAssistant extends Sprite {
    
    private static const MAX_X:int = 1750;
    private static const MAX_Y:int = 950;
    private static const NUM_BUTTONS:int = 10;
    
    private var lookMode:Boolean;
    
    private var buttonsVector:Vector.<RobotButton> = new Vector.<RobotButton>();
    private var keysTF:TextField = new TextField();
    
    public function RobotAssistant() {
        keysTF.text = "Space - reset\nCtrl+Mouse Move - put box on top";
        addChild(keysTF);
        
        for (var i:int = 0; i < NUM_BUTTONS; i++) {
            addButton();
        }
        stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDownHandler);
    }
    
    private function stage_keyDownHandler(event:KeyboardEvent):void {
        if(event.ctrlKey){
            if(!lookMode){
                for each (var button:RobotButton in buttonsVector){
                    button.addEventListener(MouseEvent.MOUSE_MOVE, button_mouseMoveHandler);
                }
            }else {
                for each (var button:RobotButton in buttonsVector){
                    button.removeEventListener(MouseEvent.MOUSE_MOVE, button_mouseMoveHandler);
                }
            }
            lookMode = !lookMode;
        }else if(event.keyCode == Keyboard.SPACE){
            resetCounters();
        }
    }
    
    private function button_mouseMoveHandler(event:MouseEvent):void {
        var currentIndex:int = getChildIndex(DisplayObject(event.currentTarget));
        var topIndex:int = numChildren - 1;
        swapChildrenAt(currentIndex, topIndex);
    }
    
    private function resetCounters():void {
        for each (var button:RobotButton in buttonsVector){
            button.reset();
        }
    }
    
    private function addButton():void {
        var currentButton:RobotButton = new RobotButton();
        currentButton.x = Utils.getRandom(0, MAX_X);
        currentButton.y = Utils.getRandom(0, MAX_Y);
        buttonsVector.push(currentButton);
        addChild(currentButton);
    }
}
}

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;

class RobotButton extends Sprite {
    private var mc:MovieClip;
    private var counter:int;
    
    function RobotButton() {
        mc = new robotButtonMC();
        addEventListener(MouseEvent.CLICK, clickHandler);
//        addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        addChild(mc);
    }
    
//    private function mouseOverHandler(event:MouseEvent):void {
//
//        var currentIndex:int = parent.getChildIndex(this);
//        var topIndex:int = parent.numChildren - 1;
//        parent.swapChildrenAt(currentIndex, topIndex);
//    }
    
    private function clickHandler(event:MouseEvent):void {
        mc.txt.text = String(++counter);
    }
    
    public function reset():void{
        counter = 0;
        mc.txt.text = "";
    }
}