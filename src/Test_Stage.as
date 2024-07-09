package {

import com.greensock.TweenLite;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;

public class Test_Stage extends BaseTest{
    private var child1:Sprite = new Sprite();
    private var child2:Sprite = new Sprite();
    public function Test_Stage() {
        child1.name = "child1";
        child2.name = "child2";
        stage.addEventListener(Event.ADDED_TO_STAGE, stage_addedToStage);
        stage.addEventListener(Event.REMOVED_FROM_STAGE, stage_removedFromStage)
        stage.addEventListener(Event.ADDED, stage_added);
        stage.addEventListener(Event.REMOVED, stage_removed);
        
        log(stage.numChildren);
        getChildList(this);
        getChildList(stage);
    
        //pre add
        addChild(child1);
        
        child2.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
        child2.addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage)
        child2.addEventListener(Event.ADDED, added);
        child2.addEventListener(Event.REMOVED, removed);
        child1.addChild(child2);
        child1.removeChild(child2);
        //post add
//        addChild(child1);
    }
    
    private function stage_removed(event:Event):void {
        log("stage_removed", stage.numChildren);
    }
    
    private function stage_added(event:Event):void {
        log("stage_added", stage.numChildren);
    }
    
    private function stage_removedFromStage(event:Event):void {
        log("stage_removedFromStage", stage.numChildren);
    }
    
    private function stage_addedToStage(event:Event):void {
        log("stage_addedToStage", stage.numChildren);
    }
    
    private function addedToStage(event:Event):void {
        log("addedToStage", stage.numChildren);
//        getChildList(this);
//        getChildList(stage);
        logParentList(DisplayObject(event.target));
    }
    
    private function removedFromStage(event:Event):void {
        log("removedFromStage", stage.numChildren);
//        getChildList(this);
//        getChildList(stage);
        logParentList(DisplayObject(event.target));
        TweenLite.delayedCall(1, logParentList, [child2], true);
    }
    
    private function added(event:Event):void {
        log("added", stage.numChildren);
//        getChildList(this);
//        getChildList(stage);
        logParentList(DisplayObject(event.target));
    }
    
    private function removed(event:Event):void {
        log("removed", stage.numChildren);
//        getChildList(this);
//        getChildList(stage);
        logParentList(DisplayObject(event.target));
    }
    
    private function getChildList(value:*):void {
        log(description(value));
        for (var i:uint = 0; i < value.numChildren; i++)
        {
            log ('\t|\t ' +i+'.\t ' + description(value.getChildAt(i)));
        }
    }
    
    private function description(value:DisplayObject):String{
        return "name:" + value.name + '\t type:' + typeof (value)+ '\t' + value;
    }
    
    private function logParentList(value:DisplayObject):void {
        log(getParentList(value));
    }
    
    private function getParentList(value:DisplayObject):String {
        var result:String = description(value) + "\n";
        if(value.parent){
            result = getParentList(value.parent) + result;
        }
        return  result;
    }
}
}
