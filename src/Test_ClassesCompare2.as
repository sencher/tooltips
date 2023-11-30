package {

import avmplus.getQualifiedClassName;

import flash.display.DisplayObject;
import flash.display.LoaderInfo;
import flash.display.Sprite;
import flash.events.IEventDispatcher;
import flash.system.ApplicationDomain;

public class Test_ClassesCompare2 extends Sprite {
    public function Test_ClassesCompare2() {
        //https://help.adobe.com/en_US/ActionScript/3.0_ProgrammingAS3/WS5b3ccc516d4fbf351e63e3d118a9b90204-7f8a.html
        var mySprite:Sprite = new Sprite();
        var asd:Asd = new Asd();
        trace(mySprite is Sprite); // true
        trace(mySprite is DisplayObject);// true
        trace(mySprite is IEventDispatcher); // true
        trace("1***************");
        trace(mySprite instanceof Sprite); // true
        trace(mySprite instanceof DisplayObject);// true
        trace(mySprite instanceof IEventDispatcher); // false
        trace("2***************");
        trace(mySprite as Sprite);                 // [object Sprite]
        trace(mySprite as DisplayObject);                 // [object Sprite]
        trace(mySprite as IEventDispatcher);                 // [object Sprite]
        trace(mySprite as Number);                                       // null
        trace("4***************");
        trace(getQualifiedClassName(mySprite));
        trace(getQualifiedClassName(asd));
//        trace(asd is getDefinition("Asd"));                 // [object Sprite]
//        trace(mySprite is getDefinition("Sprite"));                 // [object Sprite]
        trace(mySprite is getDefinition("flash.display::Sprite"));                 // [object Sprite]
//        trace(mySprite is getDefinition("DisplayObject"));                  // [object Sprite]
//        trace(mySprite is getDefinition("EventDispatcher"));                        // [object Sprite]
//        trace(mySprite is getDefinition("Number"));                                       // null
//        trace("5***************");
//        trace(mySprite instanceof getDefinition("Sprite"));                 // [object Sprite]
//        trace(mySprite instanceof getDefinition("DisplayObject"));                  // [object Sprite]
//        trace(mySprite instanceof getDefinition("EventDispatcher"));                        // [object Sprite]
//        trace(mySprite instanceof getDefinition("Number"));                                       // null
//        trace("6***************");
//        trace(mySprite as getDefinition("Sprite"));                 // [object Sprite]
//        trace(mySprite as getDefinition("DisplayObject"));                  // [object Sprite]
//        trace(mySprite as getDefinition("EventDispatcher"));                        // [object Sprite]
//        trace(mySprite as getDefinition("Number"));
    }
    
    public function getDefinition(name:String, loaderInfo:LoaderInfo=null):Class
    {
        var domain:ApplicationDomain = ApplicationDomain.currentDomain;
        if (loaderInfo != null && loaderInfo.applicationDomain != null) domain = loaderInfo.applicationDomain;
        var names = domain.getQualifiedDefinitionNames();
        try {
            return domain.getDefinition(name) as Class;
        } catch (e:Error) {
            trace("[ERROR] createObject: Cannot find class: " + name);
//            trace("[ERROR] createObject: stacktrace: " + e.getStackTrace());
        }
        return null;
    }
}
}

class Asd{

}
