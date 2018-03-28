package {
import flash.display.MovieClip;
import flash.display.MovieClip;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.system.System;
import flash.text.TextField;
import flash.text.TextFormat;

import utils.Utils;

public class Test_MemoryAddChild extends MovieClip{
    private const MAX_FRAMES:int = 1000000;
    private const CREATING:String = "creating";
    private const CREATING_ADD_CHILD:String = "creating_add_child";
    private const RE_ADD_CHILD:String = "re_add_child";
    private const REMOVE_ADD_CHILD:String = "remove_add_child";

    private var mc:MovieClip;
    private var container0:MovieClip;
    private var container1:MovieClip;
    private var tf_title:TextField;
    private var tfFree:TextField;
    private var tfPrivate:TextField;
    private var tfTotal:TextField;
    private var tfTotalNum:TextField;
    private var counter:int;

    private var maxFree:Number = 0;
    private var maxPrivate:Number = 0;
    private var maxTotal:Number = 0;
    private var maxTotalNum:Number = 0;

    private var strategy:String;
    private var format:TextFormat;

    private var i:int;
    private var currentMc:MovieClip;
    private var currentMcName:String;

    [SWF(frameRate="120")]
    public function Test_MemoryAddChild() {
        var tf:TextField;
        for(i = 1; i<5; i++) {
            currentMcName = "button" + i;
            currentMc = new MovieClip();
            currentMc.x = 100 * (i - 1);
            currentMc.addChild(Utils.drawBox());
            currentMc.name = currentMcName;
            currentMc.addEventListener(MouseEvent.CLICK, onClick);
            addChild(currentMc);
            tf = new TextField();
            tf.text = idToString(i);
            currentMc.addChild(tf);
        }
    }

    private function onClick(event:MouseEvent):void {
        for(i = 1; i<5; i++) {
            currentMcName = "button" + i;
            currentMc = MovieClip(getChildByName(currentMcName));
            this.removeChild(currentMc);
        }
        init(int(event.currentTarget.name.charAt(6)));
    }

    private function idToString(id:int):String {
        switch (id){
            case 1:
                return CREATING;
                break;
            case 2:
                return CREATING_ADD_CHILD;
                break;
            case 3:
                return RE_ADD_CHILD;
                break;
            case 4:
                return REMOVE_ADD_CHILD;
                break;
            default:
                return "";
                break;
        }
    }

    private function init(id:int):void {

        strategy = idToString(id);

        format = new TextFormat();
        format.size = 30;

        tf_title = createTF();
        tf_title.y = 100;
        tf_title.text = strategy + " / " + MAX_FRAMES;

        tfFree = createTF();
        tfFree.y = 150;

        tfPrivate = createTF();
        tfPrivate.y = 200;

        tfTotal = createTF();
        tfTotal.y = 250;

        tfTotalNum = createTF();
        tfTotalNum.y = 300;

        container0 = new MovieClip();
        container1 = new MovieClip();
        container1.x = 100;
        addChild(container0);
        addChild(container1);

        mc = new MovieClip();
        mc.addChild(Utils.drawBox());
        container0.addChild(mc);

        stage.addEventListener(Event.ENTER_FRAME, enterFrame);
    }

    public function enterFrame(event:Event = null):void {
        trace(++counter);

        switch (strategy){
            case CREATING:
                // 12.10368 / 12.14464
                Utils.drawBox();
                break;
            case CREATING_ADD_CHILD:
                // 12.10368 / 12.14464
                container0.addChild(Utils.drawBox());
                break;
            case RE_ADD_CHILD:
                // 11.382784 / 11.575296
                MovieClip(this["container" + int(counter%2)]).addChild(mc);
                break;
            case REMOVE_ADD_CHILD:
                // 11.71456 / 11.8784
                MovieClip(this["container" + int((counter + 1)%2)]).removeChild(mc);
                MovieClip(this["container" + int(counter%2)]).addChild(mc);
                break;
        }

        var curFree:Number = System.freeMemory / 1000000;
        if(curFree > maxFree){
            maxFree = curFree;
        }
        tfFree.text = "freeMemory: " + curFree + " / " + maxFree;

        var curPrivate:Number = System.privateMemory / 1000000;
        if(curPrivate > maxPrivate){
            maxPrivate = curPrivate;
        }
        tfPrivate.text = "privateMemory: " + curPrivate + " / " + maxPrivate;

        var curTotal:Number = System.totalMemory / 1000000;
        if(curTotal > maxTotal){
            maxTotal = curTotal;
        }
        tfTotal.text = "totalMemory: " + curTotal + " / " + maxTotal;

        var curTotalNum:Number = System.totalMemoryNumber / 1000000;
        if(curTotalNum > maxTotalNum){
            maxTotalNum = curTotalNum;
        }
        tfTotalNum.text = "totalMemoryNumber: " + curTotalNum + " / " + maxTotalNum;

        if(counter > MAX_FRAMES){
            stage.removeEventListener(Event.ENTER_FRAME, enterFrame);
        }
    }

    private function createTF():TextField {
        var tf:TextField = new TextField();
        tf.defaultTextFormat = format;
        tf.width = 500;
        addChild(tf)
        return tf;
    }
}
}
