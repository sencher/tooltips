package AppDomainConflict {
import avmplus.getQualifiedClassName;

import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.system.ApplicationDomain;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;


public class ApplicationDomainExample2 extends Sprite {
    private var spanishGreeterLoader:ClassLoader;
    private var englishGreeterLoader:ClassLoader;
    private var tf:TextField = new TextField();
    private var greetersLoaded:uint = 0;

    public function ApplicationDomainExample2() {
        tf.autoSize = TextFieldAutoSize.LEFT;
        addChild(tf);

        spanishGreeterLoader = new ClassLoader();
        spanishGreeterLoader.addEventListener(ClassLoader.LOAD_ERROR,loadErrorHandler);
        spanishGreeterLoader.addEventListener(ClassLoader.CLASS_LOADED,classLoadedHandler);
        spanishGreeterLoader.load("Greeter_es.swf", true);

        englishGreeterLoader = new ClassLoader();
        englishGreeterLoader.addEventListener(ClassLoader.LOAD_ERROR,loadErrorHandler);
        englishGreeterLoader.addEventListener(ClassLoader.CLASS_LOADED,classLoadedHandler);
        englishGreeterLoader.load("Greeter_en.swf", true);
    }

    private function loadErrorHandler(e:Event):void {
        tf.text = "Load failed";
        throw new IllegalOperationError("Cannot load the specified file.");
    }

    private function classLoadedHandler(e:Event):void {
        greetersLoaded++;
        if(greetersLoaded == 2) {
            greet();
        }
    }

    private function greet():void {
        trace(ApplicationDomain.currentDomain.getQualifiedDefinitionNames(), "\n");
        trace(spanishGreeterLoader.loader.contentLoaderInfo.applicationDomain.getQualifiedDefinitionNames(), "\n");
        trace(englishGreeterLoader.loader.contentLoaderInfo.applicationDomain.getQualifiedDefinitionNames(), "\n");

        var spanishGreeter:Class = spanishGreeterLoader.getClass("Greeter");
        var englishGreeter:Class = englishGreeterLoader.getClass("Greeter");
        var greeter1 = new spanishGreeter();
        var greeter2 = new englishGreeter();
        trace(getQualifiedClassName(greeter1));
        trace(getQualifiedClassName(greeter2));

        tf.text = greeter1.greet() + "\n" + greeter2.greet();
    }
}
}

import flash.display.Loader;
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

import utils.Utils;

class ClassLoader extends EventDispatcher {
    public static var CLASS_LOADED:String = "classLoaded";
    public static var LOAD_ERROR:String = "loadError";
    public var loader:Loader;
    private var swfLib:String;
    private var request:URLRequest;
    private var loadedClass:Class;

    public function ClassLoader() {

        loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeHandler);
        loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
        loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler);
    }

    public function load(lib:String, defaultDomain:Boolean = true):void {
        swfLib = lib;
        request = new URLRequest(swfLib);
        var context:LoaderContext = new LoaderContext();

        if(defaultDomain){
            context.applicationDomain = ApplicationDomain.currentDomain;
        }else{
            context.applicationDomain = new ApplicationDomain();
        }

        loader.load(request,context);
    }

    public function getClass(className:String):Class {
        try {
//            var ad:ApplicationDomain = loader_test.contentLoaderInfo.applicationDomain;
//            var names:Vector.<String> = ad.getQualifiedDefinitionNames();
//            trace(ad.domainMemory)
//            trace(ad.hasDefinition("AppDomain::" + className));
//            trace(names);
//
//            var cur:ApplicationDomain = ApplicationDomain.currentDomain;
//            trace(cur.domainMemory)
//            trace(cur.hasDefinition("AppDomain::" + className));
//            trace(cur.getQualifiedDefinitionNames());
//
//            return loader_test.contentLoaderInfo.applicationDomain.getDefinition(className)  as  Class;
            return Utils.getDefinitionIgnorePrefix(className, loader.contentLoaderInfo.applicationDomain) as Class;
        } catch (e:Error) {
            throw new IllegalOperationError(className + " definition not found in " + swfLib);
        }
        return null;
    }

    private function completeHandler(e:Event):void {
        dispatchEvent(new Event(ClassLoader.CLASS_LOADED));
    }

    private function ioErrorHandler(e:Event):void {
        dispatchEvent(new Event(ClassLoader.LOAD_ERROR));
    }

    private function securityErrorHandler(e:Event):void {
        dispatchEvent(new Event(ClassLoader.LOAD_ERROR));
    }
}