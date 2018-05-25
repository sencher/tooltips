package {
import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.ui.Keyboard;

import utils.FontUtils;
import utils.Utils;

[SWF(width="1000")]
public class Test_FontFromTTF extends Sprite {

    [Embed(
        source="../FLA_experiments/fonts/Stay Wildy.ttf",
        fontFamily="Stay Wildy",
        mimeType="application/x-font-truetype",
        embedAsCFF="false"
    )]
    private const FONT_STAY_WILDY:Class;

    [Embed(
        source="../FLA_experiments/fonts/arial.ttf",
        fontFamily="Arial",
        mimeType="application/x-font-truetype",
        embedAsCFF="false"
    )]
    private const ARIAL:Class;

    [Embed(
        source="../FLA_experiments/fonts/OfficinaSerifLT-Bold.ttf",
        fontFamily="ITC Officina Serif LT Bold",
        mimeType="application/x-font-truetype",
        embedAsCFF="false"
    )]
    private const FONT_OPEN_SANS_SEMIBOLD:Class;

    [Embed(
        source="../FLA_experiments/fonts/OpenSans-SemiBold.ttf",
        fontFamily="Open Sans SemiBold",
        mimeType="application/x-font-truetype",
        embedAsCFF="false"
    )]
    private const FONT_OFFICINA_SERIF_LT_BOLD:Class;

//    [Embed(
//        source="../FLA_experiments/fonts/OfficinaSerifC-Bold.otf",
//        fontFamily="ITC Officina Serif LT Bold",
//        mimeType="application/x-font-truetype",
//        embedAsCFF="false"
//    )]
//    private const FONT_OFFICINA_SERIF_LT_BOLD:Class;

//    private const FONT_NAME:String = "ITC Officina Serif LT Bold";
    private const FONT_NAME:String = "Futura Extra Black Condensed BT";
    private var initFormat:TextFormat;
    private var format2:TextFormat;
    private var format3:TextFormat;
    private var format4:TextFormat;

    private var tf:TextField;
    private var info_tf:TextField;

    private const STR:String = "123asdASD";
    private const STR2:String = "123asdASDфывФЫВ.,:!@#";

    public function Test_FontFromTTF() {
        FontUtils.checkFonts();
//        var font:Font = Font.enumerateFonts(false)[0];
//        trace(font.hasGlyphs(STR));

        initFormat = new TextFormat();
        initFormat.font = FontUtils.FONT_NAME_OPEN_SANS_SEMIBOLD;
        initFormat.color = 0x990000;
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
        info_tf.width = 800;
        addChild(info_tf);

        tf = new TextField();
        tf.defaultTextFormat = initFormat;
        tf.border = true;
        tf.x = tf.y = 50;
        tf.width = 500;
        tf.selectable = true;
        tf.type = TextFieldType.INPUT;
        tf.embedFonts = true;
        FontUtils.updateLabel(tf, STR, true);
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
                tf.defaultTextFormat = initFormat;
                tf.setTextFormat(initFormat);
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
        }
        updateFormatInfo();
    }

    private function updateFormatInfo():void {
        var format:TextFormat = tf.getTextFormat();
        info_tf.text = format.font + ", " + tf.embedFonts + ", " + tf.text;
    }

    private function onClick(event:MouseEvent):void {
        if(event.ctrlKey){
            tf.rotation += 45;
            trace(tf.rotation);
        }else if(event.altKey) {
            tf.defaultTextFormat = initFormat;
            FontUtils.updateLabel(tf, STR, true);
        }else{
            FontUtils.updateLabel(tf, STR2, true);
        }
        updateFormatInfo();
    }

}
}
