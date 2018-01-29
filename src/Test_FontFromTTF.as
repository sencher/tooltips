package {
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;

import utils.Utils;

import utils.Utils;

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
    private const FONT_OFFICINA_SERIF_LT_BOLD:Class;

//    [Embed(
//        source="../FLA_experiments/fonts/OfficinaSerifC-Bold.otf",
//        fontFamily="ITC Officina Serif LT Bold",
//        mimeType="application/x-font-truetype",
//        embedAsCFF="false"
//    )]
//    private const FONT_OFFICINA_SERIF_LT_BOLD:Class;

    private const FONT_NAME:String = "ITC Officina Serif LT Bold";
    private var initFormat:TextFormat;

    private var tf:TextField;
    private const STR:String = "123asdASD";
    private const STR2:String = "123asdASDфывФЫВ.,:!@#";

    public function Test_FontFromTTF() {
        Utils.checkFonts();
//        var font:Font = Font.enumerateFonts(false)[0];
//        trace(font.hasGlyphs(STR));

        initFormat = new TextFormat();
        initFormat.font = FONT_NAME;
        initFormat.color = 0x990000;
        initFormat.size = 30;

        tf = new TextField();
        tf.defaultTextFormat = initFormat;
        tf.border = true;
        tf.x = tf.y = 50;
        tf.width = 500;
        tf.selectable = true;
        tf.type = TextFieldType.INPUT;
        tf.embedFonts = true;
        Utils.updateLabel(tf, STR);
        addChild(tf);

        //trace(tf.text);
        stage.addEventListener(MouseEvent.CLICK, onClick)
    }

    private function onClick(event:MouseEvent):void {
        if(event.ctrlKey){
            tf.rotation += 45;
            trace(tf.rotation);
        }else if(event.altKey) {
            tf.defaultTextFormat = initFormat;
            Utils.updateLabel(tf, STR);
        }else{
            Utils.updateLabel(tf, STR2);
        }
    }

}
}
