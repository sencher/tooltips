package utils.wg.debug {

import com.junkbyte.console.Cc;

import wowp.controls.ButtonEx;

public class dButtonEx extends ButtonEx {
    public function dButtonEx() {
        super();
    }
    
    override public function set label(value:String):void {
        //Cc.bluecw(this, "set label", value, "_inspector:", _inspector);
        super.label = value;
    }
    
    override protected function updateText():void {
        //Cc.bluecw(this, "updateText _label:", _label, "textField:", textField, "super.data", super.data);
        super.updateText();
    }
}
}
