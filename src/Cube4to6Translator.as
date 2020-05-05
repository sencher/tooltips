package {
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.utils.Dictionary;

import utils.Utils;

[SWF(width=800, height=300, backgroundColor=0x888888)]
public class Cube4to6Translator extends Sprite {
    private var translateDict:Dictionary = new Dictionary();
    private var tf1:TextField = new TextField();
    private var tf2:TextField = new TextField();
    private var format:TextFormat = new TextFormat();

    public function Cube4to6Translator() {
        fillTranslate();
        format.size = 25;
        tf1.defaultTextFormat = tf2.defaultTextFormat = format;
        tf1.border = tf2.border = true;
        tf1.type = tf2.type = TextFieldType.INPUT;
        tf1.wordWrap = tf2.wordWrap = true;
        tf1.width = tf2.width = stage.stageWidth;
        tf1.text = "l U l U l' U' l' U' l D f2 l' f2 l U2 D' l U' l' U' l2//Safe";

        addChild(tf1);

        tf2.y = stage.stageHeight / 2;
        addChild(tf2);

        tf1.addEventListener(Event.CHANGE, tf1_changeEvent);
        translate();
    }

    private function fillTranslate():void {
        translateDict["f"] = "2-3f";
        translateDict["u"] = "2-3u";
        translateDict["r"] = "2-3r";
        translateDict["d"] = "2-3d";
        translateDict["l"] = "2-3l";
        translateDict["b"] = "2-3b";

        translateDict["Fw"] = "3f";
        translateDict["Uw"] = "3u";
        translateDict["Rw"] = "3r";
        translateDict["Dw"] = "3d";
        translateDict["Lw"] = "3l";
        translateDict["Bw"] = "3b";

        translateDict["M"] = "m";
        translateDict["E"] = "e";
        translateDict["S"] = "s";
    }

    private function tf1_changeEvent(event:Event):void {
        translate();
    }

    private function translate():void {
        var result:String = "";
        var string:String = Utils.removeTabsAndNewLines(tf1.text);
        var comments:Array = string.split("//");

        var parts:Array = comments[0].split(" ");
        var currentElement:String;
        var back:Boolean;
        var repeats:int;
        var lastChar:String;
        for (var i:int = 0; i < parts.length; i++) {
            back = false;
            repeats = 1;
            lastChar = "";
            currentElement = parts[i];

            if (currentElement.indexOf("\'") > -1) {
                back = true;
                currentElement = currentElement.substring(0, currentElement.length - 1);
            }

            lastChar = currentElement.substring(currentElement.length - 1);
            if (int(lastChar) > 0) {
                repeats = int(lastChar);
                currentElement = currentElement.substring(0, currentElement.length - 1);
            }
            if (translateDict[currentElement] != null) {
                //parts[i] = translateDict[parts[i]];
                result += translateDict[currentElement] + (repeats > 1 ? repeats : "") + String(back ? "\' " : " ");
            } else {
                result += currentElement + (repeats > 1 ? repeats : "") + String(back ? "\' " : " ");
            }
        }
        result += "//" + comments[1];
        tf2.text = result;
    }
}
}
