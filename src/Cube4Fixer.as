package {
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.utils.Dictionary;

import utils.Utils;

[SWF(width=800, height=300, backgroundColor=0x888888)]
public class Cube4Fixer extends Sprite {
    protected var translateDict:Dictionary = new Dictionary();
    protected var tf1:TextField = new TextField();
    protected var tf2:TextField = new TextField();
    protected var format:TextFormat = new TextFormat();

    public function Cube4Fixer() {
        fillTranslate();
        format.size = 25;
        tf1.defaultTextFormat = tf2.defaultTextFormat = format;
        tf1.border = tf2.border = true;
        tf1.type = tf2.type = TextFieldType.INPUT;
        tf1.wordWrap = tf2.wordWrap = true;
        tf1.width = tf2.width = stage.stageWidth;
//        tf1.text = "r'U'R'UrU'R\n"+
//                "Rw'UrU'RUr'U'r\n" +
//                "R'Rw'U'RUrU'R'UR2";
        tf1.text = "Uw Rwr";

        addChild(tf1);

        tf2.y = stage.stageHeight / 2;
        addChild(tf2);

        tf1.addEventListener(Event.CHANGE, tf1_changeEvent);

        fix();
    }

    protected function fillTranslate():void {
        translateDict["M"] = "m";
        translateDict["E"] = "e";
        translateDict["S"] = "s";

        translateDict["2F"] = "f";
        translateDict["2U"] = "u";
        translateDict["2R"] = "r";
        translateDict["2D"] = "d";
        translateDict["2L"] = "l";
        translateDict["2B"] = "b";
    }

    protected function tf1_changeEvent(event:Event):void {
        fix();
    }

    protected function fix():void {
        var result:String = "";
//        var string:String = tf1.text;
//        string = Utils.removeTabsAndNewLines(tf1.text);
//        string = string.replace("'")
//        var comments:Array = string.split("//");

        var parts:Vector.<CubeMove> = findParts(tf1.text);
        trace(parts);

//        var currentElement:CubeMove;
//        var back:Boolean;
//        var repeats:int;
//        var lastChar:String;
//        for (var i:int = 0; i < parts.length; i++) {
//            back = false;
//            repeats = 1;
//            lastChar = "";
//            currentElement = parts[i];
//
//            if (currentElement.indexOf("\'") > -1) {
//                back = true;
//                currentElement = currentElement.substring(0, currentElement.length - 1);
//            }
//
//            lastChar = currentElement.substring(currentElement.length - 1);
//            if (int(lastChar) > 0) {
//                repeats = int(lastChar);
//                currentElement = currentElement.substring(0, currentElement.length - 1);
//            }
//            if (translateDict[currentElement.move] != null) {
//                //parts[i] = translateDict[parts[i]];
//                result += translateDict[currentElement] + (repeats > 1 ? repeats : "") + String(back ? "\' " : " ");
//            } else {
//                result += currentElement + (repeats > 1 ? repeats : "") + String(back ? "\' " : " ");
//            }
//        }
//        result += "//" + comments[1];

        for each (var cm:CubeMove in parts){
            translate(cm);
            result += cm + " ";
        }
        tf2.text = result;
    }

    protected function translate(cm:CubeMove):void {
        if(translateDict[cm.rows + cm.move] != null){
            cm.move = translateDict[cm.rows + cm.move];
            cm.rows = "";
        }else if (translateDict[cm.move] != null){
            cm.move = translateDict[cm.move];
        }
    }

    protected function findParts(value:String):Vector.<CubeMove> {
        var result:Vector.<CubeMove> = new Vector.<CubeMove>();
        var currentChar:String = "";
        var cubeMove:CubeMove;

        for (var i:int = 0; i < value.length; i++) {
            cubeMove = new CubeMove();
            currentChar = value.substr(i, 1);
            //detect comment
            if(currentChar == "/"){
                cubeMove.move = value.substr(i);
                result.push(cubeMove);
                break;
            }else if(currentChar == " "){
                continue;
            }

            //detect rows
            if(Utils.isNumber(currentChar)){
                    currentChar = value.substr(i + 1, 1);
                    switch (currentChar) {
                        case "-":
                            cubeMove.rows = value.substr(i , 3);
                            i += 3;
                            break;
                        default:
                            cubeMove.rows = value.substr(i , 1);
                            i++;
                            break;
                    }
            }

            //detect move
            currentChar = value.substr(i + 1, 1);
            switch (currentChar) {
                case "w":
                    cubeMove.move = value.substr(i, 2);
                    i += 2;
                    break;
                default:
                    cubeMove.move = value.substr(i, 1);
                    i++;
                    break;
            }

            //detect repeats
            currentChar = value.substr(i, 1);
            if(Utils.isNumber(currentChar)){
                cubeMove.repeats = int(currentChar);
                i++;
            }

            //detect invert
            if(cubeMove.repeats != 2) {
                currentChar = value.substr(i, 1);
                if (currentChar == "\'") {
                    cubeMove.invert = true;
                } else {
                    i--;
                }
            }
            result.push(cubeMove);
        }
        return result;
    }
}
}

class CubeMove {
    public var rows:String;
    public var move:String;
    public var repeats:int;
    public var invert:Boolean;

    public function CubeMove() {

    }

    public function toString():String {
        return (rows ? rows : "") + move + (repeats > 1 ? repeats : "") + (invert ? "\'" : "");
    }
}
