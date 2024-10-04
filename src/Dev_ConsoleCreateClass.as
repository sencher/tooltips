package {

import com.junkbyte.console.Cc;
import com.junkbyte.console.Ct;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.utils.getDefinitionByName;

import wowp.utils.domain.getDefinition;

[SWF(width="1000", height="800")]
public class Dev_ConsoleCreateClass extends BaseTest {
    public function Dev_ConsoleCreateClass() {
        DataVO; MyButton;
        
        showConsole();
        Cc.commandLine = true;
        Cc.config.commandLineAllowed = true;
        addChild(new MyButton());
    
       // var s1 = getDefinitionByName("Sprite");
//        var s2 = getDefinitionByName("Sprite()");
        var s3 = getDefinitionByName("flash.display.Sprite");
//        var s4 = getDefinitionByName(String(Sprite));
        Cc.green2(s3);
    }
    
//    private static var _addedInstances:Array = [];
//    public function disposeClass():void {
//        Ct.orange("disposeClass", _addedInstances.length);
//        var instance:*;
//        for each(instance in _addedInstances){
//            stage.removeChild(instance);
//            if(instance.hasOwnProperty("dispose")) instance.dispose();
//        }
//        _addedInstances = [];
//    }
//
//    public function createClass(value:String):void {
//        var _class:Class = getDefinition(value, loaderInfo);
//
//        if(!_class) return;
//
//        var instance:* = new _class();
//
//        if(instance is DisplayObject){
//            instance.x = instance.y = 500;
//            _addedInstances.push(instance);
//            stage.addChild(instance);
//        }
//        Ct.orange("loaderInfo:", loaderInfo, "class:", _class, "instance:", instance);
//    }
}
}

import flash.display.MovieClip;
import flash.display.Sprite;

import utils.Utils;

class DataVO{
    public var money:int = 7000;
}

class MyButton extends MovieClip{
    private var button:Sprite;
    
    public function MyButton():void{
        name = "MyButton";
        button = Utils.createButton();
        button.name = "button";
        addChild(button);
    }
}