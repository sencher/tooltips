package {
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;

import utils.Utils;

public class RandomGenerator extends Sprite {
    private const MAXIMUM_X_POSITION:int = 100;
    private const EXCLUDE_X_POSITION:int = 200;
    private const EXCLUDE_WIDTH:int = 300;
    private const INPUT_Y_PADDING:int = 50;
    private const RESULT_Y_POSITION:int = 150;
    private const BUTTON_X:int = 350;
    
    private var iMinTF:TextField = new TextField();
    private var iMaxTF:TextField = new TextField();
    private var iExcludeTF:TextField = new TextField();
    private var iResultTF:TextField = new TextField();
    
    private var minTF:TextField = new TextField();
    private var maxTF:TextField = new TextField();
    private var excludeTF:TextField = new TextField();
    private var resultTF:TextField = new TextField();
    
    private var generateButton:Sprite;
    
    public function RandomGenerator() {
        var interfaceTextFormat:TextFormat = new TextFormat();
        interfaceTextFormat.size = 20;
        iMinTF.defaultTextFormat = iMaxTF.defaultTextFormat = iExcludeTF.defaultTextFormat = iResultTF.defaultTextFormat = interfaceTextFormat;
        iMinTF.text = "Minimal:";
        addChild(iMinTF);
        
        iMaxTF.text = "Maximum:";
        iMaxTF.x = MAXIMUM_X_POSITION;
        addChild(iMaxTF);
        
        iExcludeTF.text = "Exclude (divided by space):";
        iExcludeTF.width = EXCLUDE_WIDTH;
        iExcludeTF.x = EXCLUDE_X_POSITION;
        addChild(iExcludeTF);
        
        iResultTF.text = "Result:";
        iResultTF.y = RESULT_Y_POSITION;
        addChild(iResultTF);
        
        var inputTextFormat:TextFormat = new TextFormat();
        inputTextFormat.size = 50;
        minTF.border = maxTF.border = excludeTF.border = resultTF.border = true;
        minTF.y = maxTF.y = excludeTF.y = INPUT_Y_PADDING;
        minTF.type = maxTF.type = excludeTF.type = TextFieldType.INPUT;
        minTF.defaultTextFormat = maxTF.defaultTextFormat = excludeTF.defaultTextFormat = resultTF.defaultTextFormat = inputTextFormat;
        
        addChild(minTF);
        
        maxTF.x = MAXIMUM_X_POSITION;
        addChild(maxTF);
        
        excludeTF.x = EXCLUDE_X_POSITION;
        excludeTF.width = EXCLUDE_WIDTH;
        addChild(excludeTF);
        
        resultTF.y = RESULT_Y_POSITION + INPUT_Y_PADDING;
        addChild(resultTF);
        
        generateButton = Utils.createButton();
        generateButton.x = BUTTON_X;
        generateButton.y = RESULT_Y_POSITION;
        generateButton.addEventListener(MouseEvent.CLICK, generateButton_clickHandler)
        addChild(generateButton);
    }
    
    private function generateButton_clickHandler(event:MouseEvent):void {
        resultTF.text = String(Utils.getRandom(int(minTF.text), int(maxTF.text), Utils.splitStringIntoNumbersArray(excludeTF.text, " ")));
    }
}
}
