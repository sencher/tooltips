package AppDomain4Strategies {

import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

import utils.DomainUtils;

import utils.DomainUtils;

import wowp.utils.domain.getDefinition;

public class AppDomain4Strategies extends Sprite {
    public static var CLASS_LOADED:String = "classLoaded";
    public static var LOAD_ERROR:String = "loadError";
    
    private var currentDomain = ApplicationDomain.currentDomain;
    
    private var l1:Loader = new Loader();
    private var l2:Loader = new Loader();
    private var l3:Loader = new Loader();
    private var l4:Loader = new Loader();
    private var l5:Loader = new Loader();
    private var l6:Loader = new Loader();
    
    private var c1:LoaderContext = new LoaderContext();
    private var c2:LoaderContext = new LoaderContext();
    private var c3:LoaderContext = new LoaderContext();
    private var c4:LoaderContext = new LoaderContext();
    private var c5:LoaderContext = new LoaderContext();
    private var c6:LoaderContext = new LoaderContext();
    
    public function AppDomain4Strategies() {
        SomeCoolDataVO;
        BitmapData;
        
        trace("AppDomain4Strategies.cons");
        trace(DomainUtils.getQualifiedDefinitionNamesIgnorePrefix());
        
        c1.applicationDomain = new ApplicationDomain(currentDomain);
        l1.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        l1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        l1.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        l1.load(new URLRequest("AppDomainChild1.swf"), c1);
        
        c2.applicationDomain = currentDomain;
        l2.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        l2.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        l2.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        l2.load(new URLRequest("AppDomainChild2.swf"), c2);
        
        c3.applicationDomain = new ApplicationDomain(null);
        l3.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        l3.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        l3.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        l3.load(new URLRequest("AppDomainChild3.swf"), c3);
        
        c4.applicationDomain = new ApplicationDomain(c1.applicationDomain);
        l4.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        l4.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        l4.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        l4.load(new URLRequest("AppDomainChild4.swf"), c4);
        
        c5.applicationDomain = new ApplicationDomain(c1.applicationDomain);
        l5.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        l5.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        l5.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        l5.load(new URLRequest("AppDomainChild5.swf"), c5);
        
        c6.applicationDomain = new ApplicationDomain(c3.applicationDomain);
        l6.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        l6.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        l6.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        l6.load(new URLRequest("AppDomainChild6.swf"), c6);
        
    }
    
    private function completeHandler(e:Event):void {
        var target:LoaderInfo = LoaderInfo(e.target);
        var loader:Loader = target.loader;
        trace("loaded: " + target.url);
        trace("classes in domain:", DomainUtils.getQualifiedDefinitionNamesIgnorePrefix(target.applicationDomain));
        //dispatchEvent(new Event(CLASS_LOADED));
        
        var classNames:Vector.<String> = new Vector.<String>();

        switch (loader) {
            case l1:
                classNames.push("AppDomainChild3", "SomeCoolDataVO");
                break;
            case l2:
                classNames.push("AppDomainChild5");
                break;
            case l3:
                classNames.push("AppDomainChild2");
                break;
            case l4:
                classNames.push("AppDomainChild1");
                break;
            case l5:
                classNames.push("AppDomainChild4", "AppDomainChild5");
                break;
            case l6:
                classNames.push("AppDomainChild3", "SomeCoolDataVO");
                break;
            default:
                break;
        }
        
        tryLoad(classNames, loader.contentLoaderInfo)
    }
    
    private function tryLoad(array:Vector.<String>, loaderInfo:LoaderInfo):void {
        var cl:Class;
        var instance:*;
        for each (var s:String in array){
            cl = DomainUtils.getDefinition(s, loaderInfo);
            trace(loaderInfo.url, "searched:", s, "- result class:", cl);
            if (cl) {
                instance = new cl();
                trace("instance:", instance);
            }
        }
    }
    
    private function ioErrorHandler(e:Event):void {
        dispatchEvent(new Event(LOAD_ERROR));
    }
    
    private function securityErrorHandler(e:Event):void {
        dispatchEvent(new Event(LOAD_ERROR));
    }
}
}
