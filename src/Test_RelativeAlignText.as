package {
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.text.TextLineMetrics;
import flash.ui.Keyboard;

import utils.Utils;

import utils.Utils;

[SWF(width = 1000, height = 1000)]
public class Test_RelativeAlignText extends Sprite {
    private const TF_HEIGHT:int = 40;
    
    private const TEXT_BIG:String = "aaa bbb ccc";
    private const TEXT_SMALL:String = "123";
    
    private var tf0:TextField = new TextField();
    private var tf1:TextField = new TextField();
    private var tf2:TextField = new TextField();
    private var tf3:TextField = new TextField();
    private var tf4:TextField = new TextField();
    private var tf5:TextField = new TextField();
    private var tf6:TextField = new TextField();
    private var tf7:TextField = new TextField();
    private var tf8:TextField = new TextField();
    private var tf9:TextField = new TextField();
    private var tf10:TextField = new TextField();
    private var tf11:TextField = new TextField();
    private var tf12:TextField = new TextField();
    private var tf13:TextField = new TextField();
    private var tf14:TextField = new TextField();
    private var tf15:TextField = new TextField();
    private var tf16:TextField = new TextField();
    private var tf17:TextField = new TextField();
    
    public function Test_RelativeAlignText() {
        
        
        Utils.drawGrid(stage, 10);
        
        var leftBig:TextFormat = new TextFormat();
        var centerBig:TextFormat = new TextFormat();
        var rightBig:TextFormat = new TextFormat();
        var startBig:TextFormat = new TextFormat();
        var justifyBig:TextFormat = new TextFormat();
        var endBig:TextFormat = new TextFormat();
    
        leftBig.size = centerBig.size = rightBig.size = startBig.size = justifyBig.size = endBig.size = 40;
        
        var left:TextFormat = new TextFormat();
        var center:TextFormat = new TextFormat();
        var right:TextFormat = new TextFormat();
        var start:TextFormat = new TextFormat();
        var justify:TextFormat = new TextFormat();
        var end:TextFormat = new TextFormat();
    
        left.size = center.size = right.size = start.size = justify.size = end.size = 22;
    
        left.align = leftBig.align = TextFormatAlign.LEFT;
        center.align = centerBig.align = TextFormatAlign.CENTER;
        right.align = rightBig.align = TextFormatAlign.RIGHT;
//        start.align = startBig.align = TextFormatAlign.START;
        justify.align = justifyBig.align = TextFormatAlign.JUSTIFY;
//        end.align = endBig.align = TextFormatAlign.END;
    
        tf0.defaultTextFormat = leftBig;
        tf1.defaultTextFormat = left;
        tf2.defaultTextFormat = leftBig;
        tf3.defaultTextFormat = center;
        tf4.defaultTextFormat = leftBig;
        tf5.defaultTextFormat = right;
        tf6.defaultTextFormat = centerBig;
        tf7.defaultTextFormat = left;
        tf8.defaultTextFormat = centerBig;
        tf9.defaultTextFormat = center;
        tf10.defaultTextFormat = centerBig;
        tf11.defaultTextFormat = right;
        tf12.defaultTextFormat = rightBig;
        tf13.defaultTextFormat = left;
        tf14.defaultTextFormat = rightBig;
        tf15.defaultTextFormat = center;
        tf16.defaultTextFormat = rightBig;
        tf17.defaultTextFormat = right;
        
        var currentTF:TextField;
        for (var i:int = 0; i < 18; i++) {
            currentTF = this["tf" + i];
            currentTF.height = TF_HEIGHT;
            currentTF.width = stage.stageWidth;
            currentTF.y = i * TF_HEIGHT;
//            currentTF.x = -100;
            
//            currentTF.border = true;
            if (i % 2 == 0) {
                currentTF.htmlText = TEXT_BIG;
            } else {
                currentTF.htmlText = TEXT_SMALL;
            }
            addChild(currentTF);
        }
        stage.addEventListener(KeyboardEvent.KEY_UP, stage_keyUp);
        stage.addEventListener(MouseEvent.CLICK, click);
    }
    
    private function stage_keyUp(event:KeyboardEvent):void {
        switch (event.keyCode){
            case Keyboard.SPACE:
                shuffle();
                break;
        }
    }
    
    private function shuffle():void {
        for (var i:int = 0; i < 18; i++) {
            this["tf"+i].x += Utils.getRandom(-50, 50);
        }
    }
    
    private function click(event:MouseEvent):void {
        var s:String = "*************\n";
        for (var i:int = 0; i < 18; i += 2){
            s += "was\n";
            var m:TextLineMetrics = TextField(this["tf"+i]).getLineMetrics(0);
            s += (i) + ": " + this["tf"+i].x + ", " + m.x + ", " + m.width + "\n";
            var m:TextLineMetrics = TextField(this["tf"+(i+1)]).getLineMetrics(0);
            s += (i+1) + ": " + this["tf"+(i+1)].x + ", " + m.x + ", " + m.width + "\n";
            Utils.relativeAlignTextField(this["tf"+i], this["tf"+(i+1)]);
            TextField(this["tf"+i]).htmlText = TextField(this["tf"+i]).htmlText;
            s += "become\n";
            var m:TextLineMetrics = TextField(this["tf"+i]).getLineMetrics(0);
            s += (i) + ": " + this["tf"+i].x + ", " + m.x + ", " + m.width + "\n";
            var m:TextLineMetrics = TextField(this["tf"+(i+1)]).getLineMetrics(0);
            s += (i+1) + ": " + this["tf"+(i+1)].x + ", " + m.x + ", " + m.width + "\n";
        }
        trace(s);
    }
}
}
