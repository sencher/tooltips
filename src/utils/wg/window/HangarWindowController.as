package utils.wg.window {

import utils.wg.utils.window.*;

import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

import scaleform.clik.utils.Constraints;
import scaleform.gfx.SystemEx;

import wowp.core.eventPipe.EventPipe;
import wowp.core.layers.windows.events.HideWindowEvent;
import wowp.core.layers.windows.events.ShowWindowEvent;
import wowp.core.layers.windows.events.WindowEvent;
import wowp.hangar.model.HangarModel;
import wowp.hangar.model.common.CommonModel;
import wowp.utils.data.binding.DelayedSignal;
import wowp.utils.data.binding.Signal;
import wowp.utils.data.binding.SignalOnce;
import wowp.utils.data.ioc.IUnitInjector;
import wowp.utils.data.ioc.UInjector;
import wowp.utils.display.bottom;

public class HangarWindowController {
    include "HangarWindowControllerFluentAPI.as";
    
    public static const LOADED_CONTENT_CAROUSEL_MARGIN:int = 200;
    public static const LOADED_CONTENT_CHAT_MARGIN:int = 30;
    public static const LOADED_CONTENT_TOP_MARGIN:int = 100;
    public const onAboutToOpen:Signal = new Signal();//HangarWindowControllerToken
    /**
     * загрузка была отменена
     */
    public const onCanceled:Signal = new Signal();
    /**
     * окно закрылось
     */
    public const onClosed:Signal = new Signal();
    public const onClosedOnce:SignalOnce = new SignalOnce();
    /**
     * окно загрузилось
     */
    public const onLoaded:Signal = new Signal();
    /**
     * окно открылось
     */
    public const onOpened:Signal = new Signal();
    public const onVisible:Signal = new Signal();
    private static var _tempEmptyWindow:Sprite = new Sprite();
    public var currentPayLoad:Object;
    internal var _isOverlap:Boolean = false;
    internal var _sortOnMouseDown:Boolean = true;
    internal var _openOnBottom:Boolean = false;
    internal var _putUnder:String = null;
    internal var _owner:Sprite = null;
    internal var _defaultPayLoad:Object = null;
    internal var _closeByEscape:Boolean = true;
    internal var _skipEscape:Boolean = false;
    internal var _cache:Boolean = true;
    internal var _tempEmptyWindowEnabled:Boolean = true;
    internal var _onVisibleFlagChanged:DelayedSignal = new DelayedSignal();
    internal var _hangarOnly:Boolean = false;
    internal var _hideInCustomTab:Boolean = false;
    private var _loader:Loader;
    private var _path:String;
    private var _injector:IUnitInjector;
    private var _isPreloading:Boolean;
    
    /**
     * @param content        Окно или путь к swf
     */
    public function HangarWindowController(content:Object) {
//			Cc.logcw(this, "content", content);
        if (content is DisplayObject) {
            _isLoaded = true;
            _content = content as Sprite;
            _content.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
            _content.addEventListener(WindowEvent.VISIBILITY_CHANGED, visibilityChangeHandler);
            _content.addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler, false, int.MAX_VALUE);
        } else {
            _path = content.toString();
        }
    }
    
    private var _content:Sprite;
    
    /**
     * возвращяет загруженный контент
     */
    public function get content():DisplayObject {
        return _content;
    }
    
    private var _isLoaded:Boolean;
    
    /**
     * загрузилось ли окно
     */
    public function get isLoaded():Boolean {
        return _isLoaded;
    }
    
    private var _isLoading:Boolean;
    
    /**
     * в данный момент происходит загрузка
     */
    public function get isLoading():Boolean {
        return _isLoading;
    }
    
    private var _isOpened:Boolean;
    
    /**
     * открыто ли окно
     */
    public function get isOpened():Boolean {
        return _isLoading || _isOpened;
    }
    
    internal var _isModal:Boolean = false;
    
    public function get isModal():Boolean {
        return _isModal;
    }
    
    public function get canCloseByEscape():Boolean {
        return _closeByEscape;
    }
    
    //ескейп долежн быть обработан, но в результате ничего не должно произойти
    public function get mustSkipEscape():Boolean {
        return _skipEscape;
    }
    
    /**
     * принудительно закрывает окно, или прерывает загрузку
     */
    public function close():void {
        trace("HangarWindowController::close", getContentName());
        //	окно еще не загрузилось
        if (!_isLoaded && _isLoading) {
            if (_tempEmptyWindow.parent != null) {
                EventPipe.dispatcher.dispatchEvent(new HideWindowEvent(_tempEmptyWindow));
            }
            _isLoading = false;
            if (_loader != null) {
                _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadedHandler);
                _loader.close();
                _loader = null;
            }
            onCanceled.fire();
        }
        
        //	окно открытое
        if (_isOpened) {
            _content.dispatchEvent(new Event(Event.CLOSE, true, true));
        }
    }
    
    public function open(payload:Object = null):void {
//			Cc.logcw(this, "open", payload);
        var token:HangarWindowControllerToken = new HangarWindowControllerToken();
        var injector:IUnitInjector = null;
        if (payload != null) {
            token.payload = payload;
            injector = new UInjector(payload)
        } else if (_defaultPayLoad != null) {
            token.payload = _defaultPayLoad;
            injector = new UInjector(_defaultPayLoad);
        }
        currentPayLoad = token.payload;
        onAboutToOpen.fire(token);
        if (!token._openingPrevented) {
            openWindow(injector);
        }
    }
    
    public function injectData(payload:Object):void {
        if (_isLoading) {
            //  will be injected right after it have been loaded
            _injector = new UInjector(payload);
        } else if (_content != null) {
            new UInjector(payload).inject(_content)
        }
    }
    
    /**
     * предварительно загружает окно. Может быть полезным когда нужно мнгновенно открыть следующее окно без миганий
     */
    public function preload():void {
        if (!_isLoaded && !_isLoading && !_isPreloading) {
            _isPreloading = true;
            _isLoading = true;
            _loader = new Loader();
            _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadedHandler);
            //Cc.logcw(this, "preload loader", _path);
            _loader.load(new URLRequest(_path), new LoaderContext(false, ApplicationDomain.currentDomain));
        }
    }
    
    public function getContentName():String {
        if (_content != null) return _content.name + " " + SystemEx.describeType(_content) + " path: " + _path + " loaded:" + _isLoaded + " opened:" + isOpened + " loading:" + _isLoading;
        return "not loaded... path: " + _path + " loaded:" + _isLoaded + " opened:" + isOpened + " loading:" + _isLoading;
    }
    
    public function center():void {
        if (_content && _content.stage != null) {
            var bounds:Rectangle = _content.getBounds(_content);
            _content.x = int(_content.stage.stageWidth / 2 - bounds.width / 2 + bounds.left);
            _content.y = int(_content.stage.stageHeight / 2 - bounds.height / 2 + bounds.top);
        }
    }
    
    /**
     * открывает окно. если оно небыло загружено, то грузим его
     */
    private function openWindow(injector:IUnitInjector):void {
        //Cc.logcw(this, "openWindow", injector);
        trace("HangarWindowController::open", getContentName());
        _injector = injector;
        
        HangarModel.instance.common.onHeaderModeChanged.add(resolveVisibility);
        _onVisibleFlagChanged.add(resolveVisibility);
        
        //	чтобы не мигала подложка для модальных окон на время загрузки ложим её на самый верх
        if (_tempEmptyWindow.parent != null) {
            EventPipe.dispatcher.dispatchEvent(new HideWindowEvent(_tempEmptyWindow));
        }
        
        if (!_isLoaded)			//	если окно не загруженое, то грузим его
        {
            _isPreloading = false;
            if (_isLoading) return;	//	если уже начался процесс загрузки, то просто ждем его окончания
            _isLoading = true;
            _loader = new Loader();
            //Cc.logcw(this, "loader", _path);
            _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadedHandler);
            _loader.load(new URLRequest(_path), new LoaderContext(false, ApplicationDomain.currentDomain));
        } else if (!isOpened)	//	если окно не открыто, то открываем его
        {
            if (_injector) {
                _injector.inject(_content);
            }
            dispatchShow();
        }
        resolveVisibility();
    }
    
    private function dispatchShow():void {
        //Cc.logcw(this, "dispatchShow");
        _content.addEventListener(Event.CLOSE, closeHandler);
        _content.addEventListener(HideWindowEvent.TYPE, hideWindowHandler);
        var e:ShowWindowEvent = new ShowWindowEvent(_content, Constraints.CENTER_V | Constraints.CENTER_H,
                _isModal, _sortOnMouseDown, _openOnBottom, null, _isOverlap);
        e.owner = _owner;
        if (_putUnder != null) e.putUnder = _putUnder;
        EventPipe.dispatcher.dispatchEvent(e);
        
        // если окно немодальное, то центрируем его с учетом отступов от чата или карусели
        if (!_isModal && !_isOverlap) {
            // окно прячется под чат, то центриуем окно между верхним краем и чатом
            if (bottom(_content) > _content.stage.stageHeight - LOADED_CONTENT_CHAT_MARGIN) {
                _content.y = int((_content.stage.stageHeight - LOADED_CONTENT_CHAT_MARGIN - _content.height) / 2);
            }
            // карусель видима, и окно налазит на карусель, то центриуем окно между меню и каруселью
            else if (HangarModel.instance.carouselVisualState.visible
                    && bottom(_content) > _content.stage.stageHeight - LOADED_CONTENT_CAROUSEL_MARGIN) {
                //	работает только для окон, которые поместятся в этом промежутке
                if (_content.stage.stageHeight - LOADED_CONTENT_TOP_MARGIN - LOADED_CONTENT_CAROUSEL_MARGIN > _content.height) {
                    _content.y = int((_content.stage.stageHeight + LOADED_CONTENT_TOP_MARGIN - LOADED_CONTENT_CAROUSEL_MARGIN - _content.height) / 2);
                }
            }
        }
    }
    
    private function resolveVisibility():void {
        var visible:Boolean = isAllowedToBeVisible();
        if (_isLoading) {	//	загрузка
            if (_isModal && _tempEmptyWindowEnabled) {
                if (!_tempEmptyWindow.stage && visible) {
                    EventPipe.dispatcher.dispatchEvent(new ShowWindowEvent(_tempEmptyWindow, 0, true));
                } else if (_tempEmptyWindow.stage && !visible) {
                    EventPipe.dispatcher.dispatchEvent(new HideWindowEvent(_tempEmptyWindow));
                }
            }
        } else {			//	загружено
            setVisibility(visible);
        }
    }
    
    private function setVisibility(value:Boolean):void {
        _content.visible = value;
    }
    
    private function isAllowedToBeVisible():Boolean {
        if (_hangarOnly || _hideInCustomTab) {
            var cmn:CommonModel = HangarModel.instance.common;
            return (!_hangarOnly || cmn.isInHangar) && (!_hideInCustomTab || !cmn.isInCustomTab);
        }
        return true;
    }
    
    private function closeWindow():void {
        //Cc.logcw(this, "closeWindow");
        if (_tempEmptyWindow.parent != null) {
            EventPipe.dispatcher.dispatchEvent(new HideWindowEvent(_tempEmptyWindow));
        }
        if (!_cache) {
            _isLoaded = false;
            _isLoading = false;
        }
        trace("HangarWindowController::closeWindow", getContentName());
        _content.removeEventListener(Event.CLOSE, closeHandler);
        _content.removeEventListener(HideWindowEvent.TYPE, hideWindowHandler);
        HangarModel.instance.common.onHeaderModeChanged.remove(resolveVisibility);
        _onVisibleFlagChanged.remove(resolveVisibility);
        EventPipe.dispatcher.dispatchEvent(new HideWindowEvent(_content));
        setVisibility(true);
    }
    
    private function visibilityChangeHandler(event:WindowEvent):void {
        if (_content.visible) {
            onVisible.fire();
        }
    }
    
    private function addedToStageHandler(e:Event):void {
        _isOpened = true;
        onOpened.fire();
    }
    
    private function removedFromStageHandler(e:Event):void {
        _isOpened = false;
        onClosed.fire();
        onClosedOnce.fire();
    }
    
    //	окно загрузилось
    private function loadedHandler(e:Event):void {
//		Cc.logcw(this, "loadedHandler", _loader.content);
        _content = _loader.content as Sprite;
        _content.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        _content.addEventListener(WindowEvent.VISIBILITY_CHANGED, visibilityChangeHandler);
        _content.addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler, false, int.MAX_VALUE);
        
        _isLoading = false;
        _isLoaded = true;
        trace("HangarWindowController::loadedHandler", getContentName());
        _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadedHandler);
        if (_isPreloading) {
            _isPreloading = false;
        } else {
            //	открываем окно
            openWindow(_injector);
        }
        onLoaded.fire();
    }
    
    private function closeHandler(e:Event):void {
        //Cc.logcw(this, "closeHandler", e.isDefaultPrevented());
        if (e.isDefaultPrevented()) {
            trace("HangarWindowController::closeHandler", getContentName(), "prevent closing");
        } else {
            trace("HangarWindowController::closeHandler", getContentName());
            e.stopImmediatePropagation();
            closeWindow();
        }
    }
    
    private function hideWindowHandler(e:HideWindowEvent):void {
        //Cc.logcw(this, "hideWindowHandler", _content, e.window);
        if (_content == e.window) {
            e.stopImmediatePropagation();
            closeWindow();
        }
    }
}
}