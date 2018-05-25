package {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;

[SWF(width="1000")]
public class Test_Swap3 extends Sprite {
    private var texts:Vector.<TextField> = new Vector.<TextField>();
    private var textsStatic:Vector.<TextField> = new Vector.<TextField>();
//    private var counter:int;
    private const CELLS:int = 12;
    private const CELL_SIZE:int = 50;
    private const PADDING:int = 10;
    private const TEXT_SIZE:int = 20;
    private var initConfiguration:Array = [2,1,3,4,5,6,7,8,9,10,11,12];

    private var formatUnselected:TextFormat;
    private var formatSelected:TextFormat;
    private var formatUnsolved:TextFormat;
    private var formatSolved:TextFormat;
    private var selected:Array = [];
    private var shuffleLeftOrientation:Boolean;
    private var checkBox:TextField = new TextField();


    public function Test_Swap3() {
        formatUnselected = new TextFormat();
        formatUnselected.color = 0x000000;
        formatUnselected.size = TEXT_SIZE;

        formatSolved = new TextFormat();
        formatSolved.color = 0x00aa00;
        formatSolved.size = TEXT_SIZE;

        formatSelected = new TextFormat();
        formatSelected.color = 0xaa0000;
        formatSelected.size = TEXT_SIZE;

        formatUnsolved = new TextFormat();
        formatUnsolved.color = 0xaaaaaa;
        formatUnsolved.size = TEXT_SIZE;

        for (var i:int = 0; i < CELLS; i++){
            initElements(i);
            initStatic(i);
        }

        checkBox.selectable = false;
        changeFormat(checkBox, formatUnselected);
        checkBox.text = "to Left";
        checkBox.y = 100;
        checkBox.x = 300;
        checkBox.addEventListener(MouseEvent.CLICK, onCheckBox);
        addChild(checkBox);
        checkSolved();
    }

    private function checkSolved():void {
        for (var i:int = 0; i < CELLS; i++){
            if(texts[i].text == textsStatic[i].text){
                changeFormat(textsStatic[i], formatSolved);
            }else{
                changeFormat(textsStatic[i], formatUnsolved);
            }
        }
    }

    private function onCheckBox(event:MouseEvent):void {
        if(shuffleLeftOrientation){
            changeFormat(checkBox, formatUnselected);
        }else{
            changeFormat(checkBox, formatSelected);
        }
        shuffleLeftOrientation = !shuffleLeftOrientation;
    }

    private function initStatic(counter:int):void {
        var tf:TextField = new TextField();
        tf.x = counter * (CELL_SIZE + PADDING) + CELL_SIZE / 2;
        tf.defaultTextFormat = formatUnsolved;
        tf.text = String(counter + 1);
        tf.width = CELL_SIZE / 2;
        tf.height = 30;
        tf.selectable = false;
        tf.border = true;
        textsStatic.push(tf);
        addChild(tf);
    }

    private function initElements(counter:int):void {
        var tf:TextField = new TextField();
        tf.name = "t" + counter;
        tf.x = counter * (CELL_SIZE + PADDING);
        tf.defaultTextFormat = formatUnselected;

        //tf.text = String(counter + 1);
        tf.text = initConfiguration[counter];

        tf.width = CELL_SIZE / 2;
        tf.height = 30;
        tf.selectable = false;
        tf.border = true;
        tf.addEventListener(MouseEvent.CLICK, onClick);
        texts.push(tf);
        addChild(tf);
    }

    private function onClick(event:MouseEvent):void {
        var id:int = int(String(event.target.name).substring(1));

        if(selected.length < 3){
            if(selected.indexOf(id) > -1){
                changeFormat(texts[id], formatUnselected);
                selected.removeAt(selected.indexOf(id));
            }else{
                changeFormat(texts[id], formatSelected);
                selected.push(id);
            }

            if(selected.length >= 3){
                shuffle();
                resetFormats();
                selected = [];
            }
        }
    }

    private function shuffle():void {
        var temp:String;
        var t1:TextField = texts[selected[0]];
        var t2:TextField = texts[selected[1]];
        var t3:TextField = texts[selected[2]];

        trace(shuffleLeftOrientation ? "left" : "right", t1.text, t2.text, t3.text);

        if(shuffleLeftOrientation){
            temp = t1.text;
            t1.text = t2.text;
            t2.text = t3.text;
            t3.text = temp;
        }else{
            temp = t3.text;
            t3.text = t2.text;
            t2.text = t1.text;
            t1.text = temp;
        }

        resetFormats();
        checkSolved();
    }

    private function changeFormat(textField:TextField, format:TextFormat):void {
        textField.setTextFormat(format);
        textField.defaultTextFormat = format;
    }

    private function resetFormats():void {
        for each (var tf:TextField in texts){
            changeFormat(tf, formatUnselected);
        }
    }
}
}
