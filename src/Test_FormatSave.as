package {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

import utils.FontUtils;

public class Test_FormatSave extends Sprite {
    private var tf:TextField;
    private var tf2:TextField;
    private var tf3:TextField;

    private var format:TextFormat;
    private const TEXT:String = "ASDasd123ФЫВфыв";

    public function Test_FormatSave() {
        tf = new TextField();
        tf.width = 400;

        tf2 = new TextField();
        tf2.width = 400;
        tf2.y = 100;

        tf3 = new TextField();
        tf3.width = 400;
        tf3.y = 200;


        format = new TextFormat();
        format.size = 25;
        format.font = FontUtils.FONT_NAME_VAG_ROUNDED_BT;

        tf.defaultTextFormat = format;
        tf2.defaultTextFormat = format;
        tf3.defaultTextFormat = format;

        tf.text = TEXT;
        FontUtils.updateLabel(tf2, TEXT, false, true);
        FontUtils.updateLabel(tf3, TEXT);

        addChild(tf);
        addChild(tf2);
        addChild(tf3);
    }
}
}
