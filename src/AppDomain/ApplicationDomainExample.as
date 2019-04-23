package AppDomain {
import avmplus.describeType;
import avmplus.getQualifiedClassName;
import avmplus.getQualifiedSuperclassName;

import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.system.ApplicationDomain;
import flash.text.TextField;

import utils.Utils;

//import flash.utils.describeType;

public class ApplicationDomainExample extends Sprite {
    private var loader:ClassLoader;
    private var tf:TextField = new TextField();
//    private var mainDomainPrefix:String;

    public function ApplicationDomainExample() {
//        mainDomainPrefix = getQualifiedClassName(stage.loaderInfo.content);
//        mainDomainPrefix = mainDomainPrefix.substr(0, mainDomainPrefix.lastIndexOf(":") + 1);
//        trace(Utils.getDomainPrefix(stage.loaderInfo))
//        Utils.getQualifiedDefinitionNamesIgnorePrefix(ApplicationDomain.currentDomain);

        tf.width = stage.stageWidth;
        tf.height = stage.stageHeight;
        addChild(tf);

        stage.addEventListener(MouseEvent.CLICK, onClick)
    }

    private function onClick(event:MouseEvent):void {
        loader = new ClassLoader();
        loader.addEventListener(ClassLoader.LOAD_ERROR,loadErrorHandler);
        loader.addEventListener(ClassLoader.CLASS_LOADED,classLoadedHandler);
        loader.load("RuntimeClasses.swf");
    }

    private function loadErrorHandler(e:Event):void {
        tf.text = "Load failed";
        throw new IllegalOperationError("Cannot load the specified file.");
    }

    private function classLoadedHandler(e:Event):void {
        var runtimeClassRef:Class = loader.getClass("RuntimeClasses");
        var greeter:Object = new runtimeClassRef();

        tf.text += greeter.greet();
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
    private var loader:Loader;
    private var swfLib:String;
    private var request:URLRequest;
    private var loadedClass:Class;

    public function ClassLoader() {
        loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeHandler);
        loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
        loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler);
    }

    public function load(lib:String):void {
        swfLib = lib;
        request = new URLRequest(swfLib);
        var context:LoaderContext = new LoaderContext();
        context.applicationDomain=ApplicationDomain.currentDomain;
        loader.load(request,context);
    }

    public function getClass(className:String):Class {
        try {
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