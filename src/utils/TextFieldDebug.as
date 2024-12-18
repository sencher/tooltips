package utils {

import com.junkbyte.console.Cc;

import flash.text.TextField;

public class TextFieldDebug extends TextField {
    internal var inited:Boolean;
    
    public function TextFieldDebug() {
        super();
    }
    
    override public function set text(value:String):void {
        if(inited) Cc.green2cw(this, "text", text, ">>>", value);
        super.text = value;
        logParams();
    }
    
    override public function set htmlText(value:String):void {
        if(inited) Cc.green2cw(this, "htmlText", htmlText, ">>>", value);
        super.htmlText = value;
        logParams();
    }
    
    override public function set x(value:Number):void {
        if(inited) Cc.green2cw(this, "x", x, ">>>", value);
        super.x = value;
        logParams();
    }
    
    override public function set y(value:Number):void {
        if(inited) Cc.green2cw(this, "y", y, ">>>", value);
        super.y = value;
        logParams();
    }
    
    override public function set multiline(value:Boolean):void {
        if(inited) Cc.green2cw(this, "multiline", multiline, ">>>", value);
        super.multiline = value;
        logParams();
    }
    
    override public function set wordWrap(value:Boolean):void {
        if(inited) Cc.green2cw(this, "wordWrap", wordWrap, ">>>", value);
        super.wordWrap = value;
        logParams();
    }
    
    override public function set autoSize(value:String):void {
        if(inited) Cc.green2cw(this, "autoSize", autoSize, ">>>", value);
        super.autoSize = value;
        logParams();
    }
    
    private function logParams():void {
        if(!inited) return;
        
        Cc.green2c(this,
            "x", x,
            "y", y,
            "height", height,
            "width", width,
            "numLines", numLines
        )
    }
}
}
