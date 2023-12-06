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

    private static const REG_VAG_ROUNDED:RegExp = /vag.*rounded/i;
    private static const REG_VAG_ROUNDED_CYR:RegExp = /vag.*rounded.*cyr/i;
    private static const REG_TIMES_NEW_ROMAN:RegExp = /times.*new.*roman/i;
    private static const REG_ARIAL:RegExp = /arial/i;
    private static const REG_ARIAL_BOLD:RegExp = /arial.*bold/i;
    private static const REG_ARIAL_BLACK:RegExp = /arial.*black/i;
    private static const REG_OPEN_SANS:RegExp = /open.*sans/i;
    private static const REG_MYRIAD_PRO:RegExp = /myriad.*pro/i;
    private static const REG_MYRIAD_PRO_BOLD:RegExp = /myriad.*pro((?!semi).)*bold/i;

    [Embed(source='../../FLA_experiments/fonts/VAGRoundedLTCYR-Bold.otf', fontFamily='mVAG Rounded LT CYR Bold', mimeType="application/x-font", embedAsCFF="false")]//, fontWeight="bold"
    public static var FONT_VAGROUNDED_LT_CYR_BOLD:Class;

    [Embed(source='../../FLA_experiments/fonts/VAGRoundedBT-Regular.ttf', fontFamily='VAG Rounded BT', mimeType="application/x-font", embedAsCFF="false")]//, fontWeight="bold"
    public static var FONT_VAGROUNDED_BT:Class;

    [Embed(source="../../FLA_experiments/fonts/MyriadPro-Semibold.otf", fontFamily="mMyriad Pro Semibold", mimeType="application/x-font", embedAsCFF="false")]
    public static const FONT_MYRIAD_PRO_SEMIBOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/MyriadPro-Bold.otf", fontFamily="mMyriad Pro Bold", mimeType="application/x-font", embedAsCFF="false")]
    public static const FONT_MYRIAD_PRO_BOLD:Class;

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

    [Embed(source="../../FLA_experiments/fonts/DS-Digital.ttf", fontFamily="DS-Digital", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_DS_DIGITAL:Class;

    [Embed(source="../../FLA_experiments/fonts/DS-Digital-Bold.ttf", fontFamily="DS-Digital Bold", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_DS_DIGITAL_BOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/OpenSans-SemiBold.ttf", fontFamily="mOpen Sans Semibold", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_OPEN_SANS_SEMIBOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/OfficinaSansLT-Bold.ttf", fontFamily="ITC Officina Sans LT Bold", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_OFFICINA_SANS_BOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/OfficinaSerifLT-Book.ttf", fontFamily="ITCOfficinaSerif LT Book", mimeType="application/x-font-truetype", embedAsCFF="false")]
    public static const FONT_OFFICINA_SERIF_BOOK:Class;

    private static const ADJUST_STEP:int = 1;
    private static const ADJUST_MARGIN_RIGHT:int = 10;
    private static const ADJUST_SMALLEST_FONT_SIZE:int = 7;

    private static const WHITE:int = 0xFFFFFF;
    private static const GREEN:int = 0x138000;
    private static const ORANGE:int = 0xFF8400;
    private static const YELLOW:int = 0xFFD900;
    private static const RED:int = 0xFF2F00;
    private static const PURPLE:int = 0xC300FF;
    private static const BLUE:int = 0x0073FF;

    private static var debug:Boolean = true;

    public function FontUtils() {
    }

    public static function checkFonts():void {
        var allFonts:Array = Font.enumerateFonts(true);
        allFonts.sortOn("fontName", Array.CASEINSENSITIVE);

        var embeddedFonts:Array = Font.enumerateFonts(false);
        embeddedFonts.sortOn("fontName", Array.CASEINSENSITIVE);

        Cc.green2("Fonts : embedded", embeddedFonts.length, "/ all", allFonts.length);
        for each (var i:Font in embeddedFonts) {
            Cc.green2("\t" + fontParamsString(i));
        }
    }

    private static function fontParamsString(f:Font):String {
        return f.fontName + " / " + f.fontStyle + " / " + f.fontType;
    }

    public static function
    updateLabel(tf:TextField, str:String, html:Boolean = false, d:Boolean = false):void {
        //DEBUG
        if (debug/*str.indexOf("Your123ASD") > -1*/) {
//            Cc("logchw", "updateLabel", arguments, Env.getDefaults().getKeysFromValue(str));
//            str = '<font color=#0000ff>BLUE</font><font color="#00ff00">GREEN</font>';
//            html = true;
            tf.border = true;
            tf.background = true;
            tf.backgroundColor = WHITE;
            tf.alpha = 0.6;
        }

        if (!tf) {
            return;
        }

//        //SPIKE
//        if (html) {
//            tf.htmlText = str;
//            if (tf.htmlText != str) {
//                // TextField is set to text=htmlText="" if tags without quoted values
//                tf.htmlText = quoteHtmlParams(str);
//            }
//        } else {
//            tf.text = str;
//        }
//        return;

        var initEmbedFonts:Boolean = tf.embedFonts;

        tf.embedFonts = true;
        var initFormat:TextFormat = tf.getTextFormat();
        if (tf && initFormat.font == null) {
            tf.text = "123";
            initFormat = tf.getTextFormat();
        }

        var stringForCheck:String = str.replace(/[\n\r\t ]/g, "");
        var initFont:Font = getFontObject(initFormat);

        var initFontHasGlyphs:int = initFont ? int(initFont.hasGlyphs(stringForCheck)) : -1;

//        if(initFont){
//            if(!initFont.hasGlyphs(stringForCheck)){
//            }
//        }else{
//        }

//        var futureFormat:TextFormat;
//
//        switch (initFontHasGlyphs){
//            // No initFont
//            case -1:
//                tryApplyNewFormat(tf, stringForCheck, initFormat, false);
//                break;
//            // initFont, but missingGlyphs
//            case 0:
//                tryApplyNewFormat(tf, stringForCheck, initFormat, true);
//                break;
//            // initFont has glyphs
//            case 1:
//                break;
//        }

        if (initFontHasGlyphs < 1) {
            Cc.green2c("initFont", initFormat.font, initFormat.bold, "|", str, tf.name, missingGlyphs(initFont, stringForCheck));
            var futureFormat:TextFormat = GamuaFloxUtils.cloneObject(initFormat);
            var fixedFont:Font = getFixedFont(futureFormat, initFontHasGlyphs == 0);
            if (fixedFont) {

                futureFormat.font = fixedFont.fontName;
                futureFormat.bold = false;
                tf.defaultTextFormat = futureFormat;
                tf.setTextFormat(futureFormat);
                if (!fixedFont.hasGlyphs(stringForCheck)) {
                    if(debug) {
                        tf.backgroundColor = YELLOW;
                    }
                    Cc.errorc("fixedFont", futureFormat.font, "|", str, tf.name, missingGlyphs(fixedFont, stringForCheck));
                }else if(debug) {
                    tf.backgroundColor = BLUE;
                }
            } else {
                if(debug) {
                    tf.backgroundColor = ORANGE;
                }
                Cc.errorc("fixedFont", "No font", initFormat.font, initFormat.bold, "|", tf.name, tf.text);
            }
        }else if(debug) {
            tf.backgroundColor = GREEN;
        }

        if (html) {
            if(debug) {
                tf.backgroundColor = PURPLE;
            }
            tf.htmlText = str;
            if (tf.htmlText != str) {
                // TextField is set to text=htmlText="" if tags without quoted values
                tf.htmlText = quoteHtmlParams(str);

                // for <Coins> like swap pattern case
                if (!tf.htmlText) {
                    tf.text = str;
                }
            }
        } else {
            tf.text = str;
        }

        if (d || stringForCheck.length && !tf.textWidth) {
            Cc.errorc("fixedFont", "Empty glyphs", tf.defaultTextFormat.font, initFormat.bold, "|", tf.name, tf.text);
            if(debug) {
                tf.backgroundColor = RED;
            }
            tf.defaultTextFormat = initFormat;
            tf.setTextFormat(initFormat);
            tf.embedFonts = initEmbedFonts;
        }
    }

//    private static function tryApplyNewFormat(textField:TextField, stringForCheck:String, initFormat:TextFormat, missingGlyphs:Boolean):void {
//        var futureFormat:TextFormat = GamuaFloxUtils.cloneObject(initFormat);
//        var fixedFont:Font = getFixedFont(futureFormat);
//        if (fixedFont) {
//
//            futureFormat.font = fixedFont.fontName;
//            futureFormat.bold = false;
//            textField.defaultTextFormat = futureFormat;
//            textField.setTextFormat(futureFormat);
//            if (!fixedFont.hasGlyphs(stringForCheck)) {
//                if(debug) {
//                    textField.backgroundColor = YELLOW;
//                }
//                //Cc.errorch("fixedFont", futureFormat.font, "|", str, textField.name, missingGlyphs(fixedFont, stringForCheck));
//            }else if(debug) {
//                textField.backgroundColor = BLUE;
//            }
//        } else {
//            if(debug) {
//                textField.backgroundColor = ORANGE;
//            }
//            Cc.errorch("fixedFont", "No font", initFormat.font, initFormat.bold, "|", textField.name, textField.text);
//        }
//    }

    private static function getFixedFont(format:TextFormat, missingGlyphs:Boolean):Font {
        var name:String = format.font;
        //m - multilanguage font already
        if (name.substr(0, 1) == "m" ||
                name == FONT_NAME_DIGITAL ||
                name == FONT_NAME_DIGITAL_BOLD
        ) {
            format.bold = false;
            return getFontObject(format);
        }

        if(REG_VAG_ROUNDED_CYR.test(name)){
            format.font = MULTI_FONT_VAG_ROUNDED;
        }else if(REG_VAG_ROUNDED.test(name)){
            if(missingGlyphs){
                format.font = MULTI_FONT_VAG_ROUNDED;
            }else{
                format.font = FONT_NAME_VAG_ROUNDED_BT;
            }
        }else if(REG_TIMES_NEW_ROMAN.test(name)){
            format.font = MULTI_FONT_TIMES_NEW_ROMAN;
        }else if(REG_ARIAL_BOLD.test(name)) {
            format.font = MULTI_FONT_ARIAL_BOLD;
        }else if(REG_ARIAL_BLACK.test(name)) {
            format.font = MULTI_FONT_ARIAL_BLACK;
        }else if(REG_ARIAL.test(name)) {
            if (format.bold) {
                format.font = MULTI_FONT_ARIAL_BOLD;
                format.bold = false;
            } else {
                format.font = MULTI_FONT_ARIAL;
            }
        }else if(REG_OPEN_SANS.test(name)) {
            format.font = MULTI_FONT_OPEN_SANS_SEMIBOLD;
        }else if(REG_MYRIAD_PRO_BOLD.test(name)) {
            format.font = MULTI_FONT_MYRIAD_PRO_BOLD;
            //default
        }else{
            if (format.bold) {
                format.font = MULTI_FONT_MYRIAD_PRO_BOLD;
                format.bold = false;
            } else {
                format.font = MULTI_FONT_MYRIAD_PRO_SEMIBOLD;
            }
        }


        return getFontObject(format);
    }

    public static function getFontObject(format:TextFormat):Font {
        var fonts:Array = Font.enumerateFonts(false);
        var i:Font;
        for each (i in fonts) {
            if (i.fontName == format.font) {
                if (i.fontStyle == "bold" && format.bold) {
                    return i;
                } else if (i.fontStyle == "regular" && !format.bold) {
                    return i;
                }
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
