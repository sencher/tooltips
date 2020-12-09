package {
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;

import utils.Utils;

[SWF(width=800, height=300)]
public class RandomGeneratorAdvanced extends Sprite {
    private const INFO_HEIGHT:int = 50;
    
    private var iRangesTF:TextField = new TextField();
    private var iResultsRequiredTF:TextField = new TextField();
    private var iResultTF:TextField = new TextField();
    
    private var rangesTF:TextField = new TextField();
    private var resultsRequiredTF:TextField = new TextField();
    private var resultTF:TextField = new TextField();
    
    private var generateButton:Sprite;
    
    public function RandomGeneratorAdvanced() {
        //Common
        var interfaceTextFormat:TextFormat = new TextFormat();
        interfaceTextFormat.size = 20;
        iRangesTF.defaultTextFormat = iResultsRequiredTF.defaultTextFormat = iResultTF.defaultTextFormat = interfaceTextFormat;
        iRangesTF.selectable = iResultsRequiredTF.selectable = iResultTF.selectable = false;
        iRangesTF.height = iResultsRequiredTF.height = iResultTF.height = INFO_HEIGHT;
        iRangesTF.background = iResultsRequiredTF.background = iResultTF.background = true;
        iRangesTF.backgroundColor = iResultsRequiredTF.backgroundColor = iResultTF.backgroundColor = 0xFF0000;
        rangesTF.width = resultTF.width = iRangesTF.width = stage.stageWidth;
        
        var inputTextFormat:TextFormat = new TextFormat();
        inputTextFormat.size = 42;
        resultsRequiredTF.border = rangesTF.border = resultTF.border = true;
        resultsRequiredTF.defaultTextFormat = rangesTF.defaultTextFormat = resultTF.defaultTextFormat = inputTextFormat;
        
        iRangesTF.text = "Ranges ( example: 2-4 7-9 14 16 )";
        addChild(iRangesTF);
        
        rangesTF.y = iRangesTF.y + iRangesTF.height;
        rangesTF.multiline = rangesTF.wordWrap = true;
        resultsRequiredTF.type = rangesTF.type = TextFieldType.INPUT;
        addChild(rangesTF);
        
        generateButton = Utils.createButton(0, 0, 100, INFO_HEIGHT);
        generateButton.x = stage.stageWidth - generateButton.width;
        generateButton.y = rangesTF.y + rangesTF.height;
        generateButton.addEventListener(MouseEvent.CLICK, generateButton_clickHandler)
        addChild(generateButton);
        
        iResultsRequiredTF.text = "Results required:";
        resultsRequiredTF.width = iResultsRequiredTF.width = iResultTF.width = (stage.stageWidth - generateButton.width) / 2;
        addChild(iResultsRequiredTF);
        
        iResultTF.text = "Result:";
        iResultsRequiredTF.y = iResultTF.y = rangesTF.y + rangesTF.height;
        resultTF.x = iResultTF.x = iResultsRequiredTF.x + iResultsRequiredTF.width;
        addChild(iResultTF);
        
        resultsRequiredTF.x = iResultsRequiredTF.x;
        resultTF.y = resultsRequiredTF.y = iResultsRequiredTF.y + iResultsRequiredTF.height;
        addChild(resultsRequiredTF);
        
        addChild(resultTF);
        
        //start values
        rangesTF.text = "1-11";
        resultsRequiredTF.text = "1";
//        rangesTF.text = "1-4 77-81";
//        rangesTF.text = "-15--12 -3-3 1-4 1234-1236 -14 22 1235 -111 -5-0";
    }
    
    private function generateButton_clickHandler(event:MouseEvent):void {
        var resultsRequired:int = int(resultsRequiredTF.text);
        var availableVariants:Array = generateVariants(rangesTF.text);
//        trace(availableVariants);
        var resultArray:Array = [];
        if (availableVariants.length < resultsRequired) {
            resultsRequired = availableVariants.length;
        }
        
        while (resultArray.length < resultsRequired) {
            var index:int = Utils.getRandom(0, availableVariants.length - 1);
            var element:int = availableVariants.splice(index, 1)[0];
            resultArray.push(element);
        }
        
        resultArray.sort(Array.NUMERIC);
        resultTF.text = resultArray.toString();
    }
    
    private function generateVariants(value:String):Array {
        var result:Array = [];
        var currentChar:String = "";
        var startRangeNumber:String = "";
        var rangeOpened:Boolean = false;
        var endRangeNumber:String = "";
        
        for (var i:int = 0; i <= value.length; i++) {
            currentChar = value.substr(i, 1);
            
            if (currentChar == "-") {
                if (!rangeOpened) {
                    if (!startRangeNumber) {
                        startRangeNumber += currentChar;
                    } else {
                        rangeOpened = true;
                    }
                } else {
                    endRangeNumber += currentChar;
                }
            } else if (Utils.isNumber(currentChar)) {
                if (!rangeOpened) {
                    startRangeNumber += currentChar;
                } else {
                    endRangeNumber += currentChar;
                }
            } else {
                if (!rangeOpened) {
                    Utils.pushIgnoreIfExist(result, int(startRangeNumber));
                } else {
                    fillArray(result, int(startRangeNumber), int(endRangeNumber));
                }
                //reset
                startRangeNumber = endRangeNumber = "";
                rangeOpened = false;
            }
        }
        return result;
    }
    
    private function fillArray(array:Array, start:int, end:int):void {
        for (var i:int = start; i <= end; i++) {
            Utils.pushIgnoreIfExist(array, i);
        }
    }
}
}
