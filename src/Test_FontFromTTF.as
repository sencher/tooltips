package {
import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.ui.Keyboard;

import utils.FontUtils;
import utils.Utils;

[SWF(width="1000")]
public class Test_FontFromTTF extends Sprite {

    private var initFormat:TextFormat;
    private var format2:TextFormat;
    private var format3:TextFormat;
    private var format4:TextFormat;

    private var tf:TextField;
    private var info_tf:TextField;

    private const STR:String = "123asdASD";
    private const STR2:String = "123asdASDфывФЫВ.,:!@#";

    public function Test_FontFromTTF() {

        Cc.start(this)
        Cc.visible = true;
        Cc.y = 100;

        FontUtils.checkFonts();
//        var font:Font = Font.enumerateFonts(false)[0];
//        trace(font.hasGlyphs(STR));

        initFormat = new TextFormat();
        initFormat.font = FontUtils.FONT_NAME_OPEN_SANS_SEMIBOLD;
        initFormat.color = 0x990000;

        initFormat.leading = 2;

        initFormat.size = 30;

        format2 = new TextFormat();
        format2.font = FontUtils.FONT_NAME_OFFICINA_SANS_BOLD;
        format2.color = 0x999900;
        format2.size = 30;

        format3 = new TextFormat();
        format3.font = FontUtils.FONT_NAME_OFFICINA_SERIF_BOOK;
        format3.color = 0x999999;
        format3.size = 30;

        format4 = new TextFormat();
        format4.font = FontUtils.FONT_NAME_MYRIAD_PRO;
        format4.color = 0x99aa44;
        format4.size = 30;

        info_tf = new TextField();
        info_tf.defaultTextFormat = initFormat;
        info_tf.y = 300;
        info_tf.width = 1000;
        addChild(info_tf);

        tf = new TextField();
        tf.defaultTextFormat = initFormat;
        tf.border = true;
        tf.x = tf.y = 50;
        tf.width = 500;
        tf.selectable = true;
        tf.type = TextFieldType.INPUT;

        tf.antiAliasType = AntiAliasType.ADVANCED;
        tf.maxChars = 32;

        tf.embedFonts = true;

        FontUtils.updateLabel(tf, STR);
        addChild(tf);

        //trace(tf.text);
        stage.addEventListener(MouseEvent.CLICK, onClick);
        stage.addEventListener(KeyboardEvent.KEY_UP, onKey);
        updateFormatInfo();
    }

    private function onKey(event:KeyboardEvent):void {
        switch (event.keyCode){
            case Keyboard.NUMBER_1:
                tf.embedFonts = !tf.embedFonts;
                break;
            case Keyboard.NUMBER_2:
                tf.setTextFormat(initFormat);
                //tf.defaultTextFormat = initFormat;
                FontUtils.updateLabel(tf,tf.text);
                break;
            case Keyboard.NUMBER_3:
                tf.defaultTextFormat = format2;
                tf.setTextFormat(format2);
                break;
            case Keyboard.NUMBER_4:
                tf.defaultTextFormat = format3;
                tf.setTextFormat(format3);
                break;
            case Keyboard.NUMBER_5:
                tf.defaultTextFormat = format4;
                tf.setTextFormat(format4);
                break;
            case Keyboard.NUMBER_6:
                FontUtils.updateLabel(tf, Utils.generateRandomString(12));
                break;
            case Keyboard.NUMBER_7:
                FontUtils.updateLabel(tf, Utils.generateRandomString(18, true));
                break;
            case Keyboard.NUMBER_8:
                FontUtils.updateLabel(tf, tf.text);
                break;
        }
        updateFormatInfo();
    }

    private function updateFormatInfo():void {
        var format:TextFormat = tf.getTextFormat();
        info_tf.text = format.font + ", " + tf.embedFonts + ", " + tf.textWidth + ", " + tf.text;
    }

    private function onClick(event:MouseEvent):void {
        if(event.ctrlKey){
            tf.rotation += 45;
            trace(tf.rotation);
        }else if(event.altKey) {
            tf.defaultTextFormat = initFormat;
            FontUtils.updateLabel(tf, STR);
        }else{
            FontUtils.updateLabel(tf, STR2);
        }
        updateFormatInfo();
    }

}
}
