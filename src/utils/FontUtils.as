/*
 * Copyright (c) 2018 Gamepoint. All Rights Reserved.
 *
 * @author Sergey Senkov
 */
package utils {

import com.junkbyte.console.Cc;

import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;

public class FontUtils {
    public static var FONT_NAME_VAGROUNDED_BT:String = "VAGRounded BT";
    public static var FONT_NAME_VAG_ROUNDED_BT:String = "VAG Rounded BT";
    public static var FONT_NAME_VAG_ROUNDED_LT_CYR_BOLD:String = "VAG Rounded LT CYR Bold";
    public static var MULTI_FONT_VAG_ROUNDED:String = "mVAG Rounded LT CYR Bold";

    public static var FONT_NAME_MYRIAD_PRO:String = "Myriad Pro";
    public static var FONT_NAME_MYRIAD_PRO_SEMIBOLD:String = "Myriad Pro Semibold";
    public static var MULTI_FONT_MYRIAD_PRO_SEMIBOLD:String = "mMyriad Pro Semibold";
    public static var FONT_NAME_MYRIAD_PRO_BOLD:String = 'Myriad Pro Bold';
    public static var MULTI_FONT_MYRIAD_PRO_BOLD:String = 'mMyriad Pro Bold';

    public static var FONT_NAME_TIMES_NEW_ROMAN:String = "Times New Roman";
    public static var MULTI_FONT_TIMES_NEW_ROMAN:String = "mTimes New Roman";

    public static var FONT_NAME_ARIAL:String = "Arial";
    public static var FONT_NAME_ARIAL_BOLD:String = "Arial Bold";
    public static var FONT_NAME_ARIAL_BLACK:String = "Arial Black";
    public static var MULTI_FONT_ARIAL:String = "mArial";
    public static var MULTI_FONT_ARIAL_BOLD:String = "mArial Bold";
    public static var MULTI_FONT_ARIAL_BLACK:String = "mArial Black";

    public static var FONT_NAME_DIGITAL:String = "DS-Digital";
    public static var FONT_NAME_DIGITAL_BOLD:String = "DS-Digital Bold";

    public static var FONT_NAME_OPEN_SANS_SEMIBOLD:String = "Open Sans SemiBold";
    public static var MULTI_FONT_OPEN_SANS_SEMIBOLD:String = "mOpen Sans Semibold";

    public static var FONT_NAME_OFFICINA_SANS_BOLD:String = "ITC Officina Sans LT Bold";
    public static var FONT_NAME_OFFICINA_SERIF_BOOK:String = "ITCOfficinaSerif LT Book";

    [Embed(source="../../FLA_experiments/fonts/MyriadPro-Semibold.otf", fontFamily="mMyriad Pro Semibold", mimeType="application/x-font", embedAsCFF="false")]
    public static const FONT_MYRIAD_PRO_SEMIBOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/MyriadPro-Bold.otf", fontFamily="mMyriad Pro Bold", mimeType="application/x-font", embedAsCFF="false")]
    public static const FONT_MYRIAD_PRO_BOLD:Class;

    [Embed(source='../../FLA_experiments/fonts/VAGRoundedLTCYR-Bold.otf', fontFamily='mVAG Rounded LT CYR Bold', mimeType="application/x-font", embedAsCFF="false", fontWeight="bold")]
    public static var FONT_VAGROUNDED_LT_CYR_BOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/times.ttf", fontFamily="mTimes New Roman", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_TIMES_NEW_ROMAN:Class;

    [Embed(source="../../FLA_experiments/fonts/arial.ttf", fontFamily="mArial", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_ARIAL:Class;

    [Embed(source="../../FLA_experiments/fonts/arialbd.ttf", fontFamily="mArial Bold", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_ARIAL_BOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/ariblk.ttf", fontFamily="mArial Black", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_ARIAL_BLACK:Class;

    [Embed(source="../../FLA_experiments/fonts/arial.ttf", fontFamily="mArial CFF", mimeType="application/x-font-truetype", embedAsCFF="true")]
    public static const FONT_ARIAL_CFF:Class;

    [Embed(source="../../FLA_experiments/fonts/arialbd.ttf", fontFamily="mArial Bold CFF", mimeType="application/x-font-truetype", embedAsCFF="true")]
    public static const FONT_ARIAL_BOLD_CFF:Class;

    [Embed(source="../../FLA_experiments/fonts/OpenSans-SemiBold.ttf", fontFamily="mOpen Sans Semibold", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_OPEN_SANS_SEMIBOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/OfficinaSansLT-Bold.ttf", fontFamily="ITC Officina Sans LT Bold", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_OFFICINA_SANS_BOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/OfficinaSerifLT-Book.ttf", fontFamily="ITCOfficinaSerif LT Book", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_OFFICINA_SERIF_BOOK:Class;

    private static const ADJUST_STEP:int = 1;
    private static const ADJUST_MARGIN_RIGHT:int = 10;
    private static const ADJUST_SMALLEST_FONT_SIZE:int = 7;

    public function FontUtils() {
    }

    public static function checkFonts():void {
        var allFonts:Array = Font.enumerateFonts(true);
        allFonts.sortOn("fontName", Array.CASEINSENSITIVE);

        var embeddedFonts:Array = Font.enumerateFonts(false);
        embeddedFonts.sortOn("fontName", Array.CASEINSENSITIVE);

        Cc.log("Fonts : embedded", embeddedFonts.length, "/ all", allFonts.length);
        for each (var i:Font in embeddedFonts) {
            Cc.log("\t" + fontParamsString(i));
        }
    }

    private static function fontParamsString(f:Font):String {
        return f.fontName + " / " + f.fontStyle + " / " + f.fontType;
    }

    public static function updateLabel(tf:TextField, str:String, html:Boolean = false):void {
        //DEBUG
        if(str.indexOf("Your personal") > -1){
//            Cc("logchw", "updateLabel", arguments, Env.getDefaults().getKeysFromValue(str));
//            str = '<font color=#0000ff>BLUE</font><font color="#00ff00">GREEN</font>';
//            html = true;
            tf.border = true;
            tf.background = true;
            tf.backgroundColor = 0xffeeee;
        }
        if (!tf) {
            return;
        }

        tf.embedFonts = true;
        var format:TextFormat = tf.getTextFormat();
        if (tf && format.font == null) {
            tf.text = "123";
            format = tf.getTextFormat();
        }

        var stringForCheck:String = str.replace(/[\n\r\t ]/g, "");
        var initFont:Font = getFontObject(format.font);
        if (!initFont || !initFont.hasGlyphs(stringForCheck)) {
            Cc.logch("Font", format.font, "|", str, tf.name, missingGlyphs(initFont, stringForCheck));
            var fixedFont:Font = getFixedFont(format.font);
            if (fixedFont) {
                format.font = fixedFont.fontName;
                tf.defaultTextFormat = format;
                tf.setTextFormat(format);
                if (!fixedFont.hasGlyphs(stringForCheck)) {
                    Cc.logch("Font", format.font, "|", str, tf.name, missingGlyphs(fixedFont, stringForCheck));
                }
            }
        }

        if (html) {
            tf.htmlText = str;
            if (tf.htmlText != str) {
                // TextField is set to text=htmlText="" if tags without quoted values
                tf.htmlText = quoteHtmlParams(str);
            }
        } else {
            tf.text = str;
        }
    }

    private static function getFixedFont(fontName:String):Font {
        //m - multilanguage font already
        if (fontName.substr(0, 1) == "m" ||
                fontName == FONT_NAME_DIGITAL ||
                fontName == FONT_NAME_DIGITAL_BOLD
        ) {
            return getFontObject(fontName);//TODO: Should be null here to prevent re-set same format. But for some reason null here stucks the game.
        }
        var fixedFontString:String;
        switch (fontName) {
            case FONT_NAME_VAGROUNDED_BT:
            case FONT_NAME_VAG_ROUNDED_BT:
            case FONT_NAME_VAG_ROUNDED_LT_CYR_BOLD:
                fixedFontString = MULTI_FONT_VAG_ROUNDED;
                break;
            case FONT_NAME_MYRIAD_PRO:
            case FONT_NAME_MYRIAD_PRO_SEMIBOLD:
                fixedFontString = MULTI_FONT_MYRIAD_PRO_SEMIBOLD;
                break;
            case FONT_NAME_MYRIAD_PRO_BOLD:
                fixedFontString = MULTI_FONT_MYRIAD_PRO_BOLD;
                break;
            case FONT_NAME_TIMES_NEW_ROMAN:
                fixedFontString = MULTI_FONT_TIMES_NEW_ROMAN;
                break;
            case FONT_NAME_ARIAL:
                fixedFontString = MULTI_FONT_ARIAL;
                break;
            case FONT_NAME_ARIAL_BOLD:
                fixedFontString = MULTI_FONT_ARIAL_BOLD;
                break;
            case FONT_NAME_ARIAL_BLACK:
                fixedFontString = MULTI_FONT_ARIAL_BLACK;
                break;
            case FONT_NAME_OPEN_SANS_SEMIBOLD:
                fixedFontString = MULTI_FONT_OPEN_SANS_SEMIBOLD;
                break;
            default:
                fixedFontString = MULTI_FONT_MYRIAD_PRO_SEMIBOLD;
                break;
        }

        return getFontObject(fixedFontString);
    }

    public static function getFontObject(fontString:String):Font {
        var fonts:Array = Font.enumerateFonts(false);
        var i:Font;
        for each (i in fonts) {
            if (i.fontName == fontString) {
                return i;
            }
        }
        return null;
    }

    public static function missingGlyphs(font:Font, string:String):String {
        if (!font) {
            return "No Embed font!";
        }
        string = string.replace(/[\n\r\t ]/g, "");

        var missing:String;
        if (!font.hasGlyphs(string)) {
            var missingGlyphs:Object = new Object();
            missing = "";
            for (var i:uint = 0; i < string.length; ++i) {
                var char:String = string.charAt(i);
                var charCode:int = char.charCodeAt();
                if (!font.hasGlyphs(char) && !missingGlyphs[char]) {
                    missingGlyphs[char] = char;
                    missing += ((missing == "") ? "" : ", ") + "\"" + char + "\" [" + charCode + "]";
                }
            }
        }

        return missing;
    }

    /**
     * Converting string like this: <p align=center>
     * to strings like that: <p align="center"> (Because TextField are ignore strings without quoted values)
     */
    private static const tagsRegExp:RegExp = / < ([^<]*) \/? > /ix;
    private static const paramsRegExp:RegExp = / ([a-z0-9]+) \s* = \s*  ([#a-z0-9]+) /ix;

    public static function quoteHtmlParams(html:String):String {
        var newHtml:String = '';
        while (html != '') {
            if (tagsRegExp.test(html)) {
                var tagsData:Object = tagsRegExp.exec(html);
                var tag:String = tagsData[0];
                var body:String = tagsData[1];

                var i:int = html.indexOf(tag);
                if (i > 0) {
                    newHtml += html.substr(0, i);
                    html = html.substr(i);
                }
                html = html.replace(tag, '');

                while (paramsRegExp.test(body)) {
                    var bodyData:Object = paramsRegExp.exec(body);
                    var all:String = bodyData[0];
                    var param:String = bodyData[1];
                    var value:String = bodyData[2];

                    body = body.replace(all, param + '="' + value + '"');
                }

                newHtml += '<' + body + '>';
            } else {
                newHtml += html;
                html = '';
            }
        }

        return newHtml;
    }

    public static function adjustFontSize(tf:TextField, maxSize:int, rightSpace:Number = 0):void {
        if (!tf || !tf.text) {
            return;
        }
        var format:TextFormat = tf.getTextFormat();

        if (tf.textWidth + ADJUST_MARGIN_RIGHT > tf.width - rightSpace) {
            adjustDown(tf, format, rightSpace);
        } else {
            adjustUp(tf, format, maxSize, rightSpace);
        }
        tf.defaultTextFormat = format;
    }

    private static function adjustDown(tf:TextField, format:TextFormat, rightSpace:Number):void {
        if (format.size <= ADJUST_SMALLEST_FONT_SIZE) {
            return;
        }

        format.size = Number(format.size) - ADJUST_STEP;
        tf.setTextFormat(format);

        if (tf.textWidth + ADJUST_MARGIN_RIGHT > tf.width - rightSpace) {
            adjustDown(tf, format, rightSpace);
        }
    }

    private static function adjustUp(tf:TextField, format:TextFormat, maxSize:int, rightSpace:Number):void {
        if (format.size >= maxSize) {
            return;
        }

        format.size = Number(format.size) + ADJUST_STEP;
        tf.setTextFormat(format);

        if (tf.textWidth + ADJUST_MARGIN_RIGHT < tf.width - rightSpace) {
            adjustUp(tf, format, maxSize, rightSpace);
        }
    }
}
}
