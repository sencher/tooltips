package {
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;

import utils.Utils;

public class RandomGeneratorAdvanced extends Sprite {
    private const INPUT_Y_PADDING:int = 50;
    private const RESULT_Y_POSITION:int = 200;
    private const BUTTON_X:int = 350;
    
    private var iRangesTF:TextField = new TextField();
    private var iResultTF:TextField = new TextField();
    
    private var rangesTF:TextField = new TextField();
    private var resultTF:TextField = new TextField();
    
    private var generateButton:Sprite;
    
    public function RandomGeneratorAdvanced() {
        var interfaceTextFormat:TextFormat = new TextFormat();
        interfaceTextFormat.size = 20;
        iRangesTF.defaultTextFormat = iResultTF.defaultTextFormat = interfaceTextFormat;
        iRangesTF.text = "Ranges ( example: 2-4 7-9 14 16 )";
        addChild(iRangesTF);
        
        
        iResultTF.text = "Result:";
        iResultTF.y = RESULT_Y_POSITION;
        addChild(iResultTF);
        
        var inputTextFormat:TextFormat = new TextFormat();
        inputTextFormat.size = 50;
        rangesTF.border = resultTF.border = true;
        rangesTF.y = INPUT_Y_PADDING;
        rangesTF.type = TextFieldType.INPUT;
        rangesTF.defaultTextFormat = resultTF.defaultTextFormat = inputTextFormat;
//        minTF.text = "-15--12 -3-3 1-4 1234-1236 -14 22 1235 -111 -5-0";
        rangesTF.text = "1-10";
        rangesTF.width = resultTF.width = iRangesTF.width = iResultTF.width = stage.stageWidth;
        
        addChild(rangesTF);
        
        resultTF.y = RESULT_Y_POSITION + INPUT_Y_PADDING;
        addChild(resultTF);
        
        generateButton = Utils.createButton();
        generateButton.x = BUTTON_X;
        generateButton.y = rangesTF.y + rangesTF.height;
        generateButton.addEventListener(MouseEvent.CLICK, generateButton_clickHandler)
        addChild(generateButton);
    }
    
    private function generateButton_clickHandler(event:MouseEvent):void {
        var availableVariants:Array = generateVariants(rangesTF.text);
//        trace(availableVariants);
        var index:int = Utils.getRandom(0, availableVariants.length - 1);
        resultTF.text = String(availableVariants[index]);
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
