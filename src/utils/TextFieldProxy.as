package utils {

import com.junkbyte.console.Cc;

import flash.text.TextField;

public class TextFieldProxy extends TextField{
    private var original:TextField;
    
    public function TextFieldProxy(originalTF:TextField) {
        original = originalTF;
    }
    
    override public function set text(value:String):void {
        Cc.green2cw(this, "text", original.text, ">>>", value);
        original.text = value;
        logParams();
    }
    
    override public function set htmlText(value:String):void {
        Cc.green2cw(this, "htmlText", original.htmlText, ">>>", value);
        original.htmlText = value;
        logParams();
    }
    
    override public function set x(value:Number):void {
        Cc.green2cw(this, "x", original.x, ">>>", value);
        original.x = value;
        logParams();
    }
    
    override public function set y(value:Number):void {
        Cc.green2cw(this, "y", original.y, ">>>", value);
        original.y = value;
        logParams();
    }
    
    override public function set multiline(value:Boolean):void {
        Cc.green2cw(this, "multiline", multiline, ">>>", value);
        super.multiline = value;
        logParams();
    }
    
    override public function set wordWrap(value:Boolean):void {
        Cc.green2cw(this, "wordWrap", wordWrap, ">>>", value);
        super.wordWrap = value;
        logParams();
    }
    
    override public function set autoSize(value:String):void {
        Cc.green2cw(this, "autoSize", autoSize, ">>>", value);
        super.autoSize = value;
        logParams();
    }
    
    private function logParams():void {
        Cc.green2c
        (this,
                "x", original.x,
                "y", original.y,
                "height", original.height,
                "width", original.width,
                "numLines", original.numLines
        )
    }
}
}
