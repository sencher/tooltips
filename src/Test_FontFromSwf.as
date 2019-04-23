package {
import flash.display.Sprite;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;
import flash.text.Font;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import utils.Utils;

public class Test_FontFromSwf extends Sprite {

    public static const FONT_NAME:String = "VAG Rounded BT";
    public static const FONT_EXPORT_NAME:String = "VAGRoundedBT";
    //D:\Work\tooltips\FLA_experiments\font_to_swf.swf
    public static const FONT_FILE_NAME:String = "../FLA_experiments/font_to_swf.swf";

    private const STR:String = "Embed.,;Русский567";

    public function Test_FontFromSwf() {
        /*add your "FLA_experiments" folder to trusted locations*/
        Utils.checkFonts();

        var loader:Loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onFontLoaded);
        loader.addEventListener(IOErrorEvent.IO_ERROR, onFontLoadingFailed);
        loader.addEventListener(IOErrorEvent.NETWORK_ERROR, onFontLoadingFailed);
        loader.addEventListener(IOErrorEvent.VERIFY_ERROR, onFontLoadingFailed);
        loader.addEventListener(IOErrorEvent.DISK_ERROR, onFontLoadingFailed);
        loader.load(new URLRequest(FONT_FILE_NAME));
    }

    private function onFontLoaded(e:Event):void {
        trace("Successfully loaded " + FONT_EXPORT_NAME + " (" + FONT_FILE_NAME + ")");
        if(e.target.applicationDomain.hasDefinition(FONT_EXPORT_NAME)) {
            var FontClass:Class = e.target.applicationDomain.getDefinition(FONT_EXPORT_NAME) as Class;
            Font.registerFont(FontClass);
            Utils.checkFonts();
            addTextField();
        } else {
            trace("Missing " + FONT_EXPORT_NAME + "!");
        }
    }
    private function onFontLoadingFailed(e:IOErrorEvent):void {
        trace("Missing " + FONT_FILE_NAME);
    }
    private function addTextField():void {
        trace("Adding text field ...");
        var font:Font = Font.enumerateFonts(false)[0];
        trace(font.hasGlyphs(STR));

        var format:TextFormat = new TextFormat();
        format.font = FONT_NAME;
        format.size = 45;
        format.color = 0x9f0000;
        format.bold = false;

        var tf:TextField = new TextField();
        tf.defaultTextFormat = format;
        tf.embedFonts = true;
        tf.width = 500;
        tf.text = STR;
        tf.x = tf.y = 35;
        tf.autoSize = TextFieldAutoSize.LEFT;
        tf.border = true;
        tf.rotation = 10;

        addChild(tf);


        trace(tf.text,tf.width);

    }
}
}
