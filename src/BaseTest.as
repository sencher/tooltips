package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.ui.Keyboard;
import flash.utils.getTimer;

import utils.Utils;

[SWF(width="800", height="800")]
public class BaseTest extends Sprite {
    public static var creationTime:int = getTimer();
    private static const BUTTON_WIDTH:int = 75;
    private var tf:TextField = new TextField();
    private var f:TextFormat = new TextFormat();
    private var button:Sprite;
    public function BaseTest() {
        f.size = 40;
        tf.name = "BaseTestTextField";
        tf.type = TextFieldType.INPUT;
        tf.defaultTextFormat = f;
        tf.width = stage.stageWidth;
        tf.height = stage.stageHeight;
        tf.multiline = true;
        addChild(tf);
        button = Utils.createButton(stage.stageWidth - BUTTON_WIDTH,0, BUTTON_WIDTH, 40, 0,0,0.5);
        button.addEventListener(MouseEvent.CLICK, buttonClick);
        addChild(button);
    }
    
    private function buttonClick(event:Event):void {
        //Clear
        tf.text = "";
    }
    
    public function log(...value):void{
        tf.htmlText += value + "\n";
        trace(value);
    }
    
    public function overRide(value:* = ""):void{
        tf.htmlText = value + "\n";
    }
    
    public function showConsole():void{
        Cc.start(this);
        Cc.config.flashTrace = false;
        Cc.width = stage.stageWidth;
        Cc.height = stage.stageHeight / 2;
        Cc.visible = true;
    }
    
    public function elapsedTime():int{
        return getTimer() - creationTime;
    }
    
    public function createSpiteWithName(value:String):Sprite {
        var sprite:Sprite = new Sprite();
        sprite.name = value;
        return sprite;
    }
}
}
