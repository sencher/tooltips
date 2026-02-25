package wowp.utils.display {

import com.junkbyte.console.Cc;
import com.junkbyte.console.Ct;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;

import wowp.core.error;

import wowp.utils.data.binding.Signal;
import wowp.utils.debug.DebugUtils;

public class BitmapLoader extends Sprite {
    protected const _bitmaps:Vector.<BitmapAutoLoader> = new Vector.<BitmapAutoLoader>();
    public const onErrorLoad:Signal = new Signal();
    public const onLoaded:Signal = new Signal();
    public const onLoadedOnce:Signal = new Signal();
    public var mcSize:MovieClip;
    [Inspectable]
    public var lockSize:Boolean = false;
    protected var _originalWidth:Number = 1;
    protected var _originalHeight:Number = 1;
    protected var _smoothing:Boolean;
    
    public function BitmapLoader() {
        _originalHeight = height;
        _originalWidth = width;
        if (scaleX != 1) scaleX = 1;
        if (scaleY != 1) scaleY = 1;
//        addEventListener(Event.ADDED_TO_STAGE, addedToStage_handler);
//        addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage_handler);
    }

//    private function addedToStage_handler(event:Event):void {
//        if (DebugUtils.isInterestingString(path)) Cc.yellowcw(this, "addedToStage_handler path:", _path, "smoothing:", _smoothing);
//    }

//    private function removedFromStage_handler(event:Event):void {
//        if (DebugUtils.isInterestingString(path)) Cc.redcw(this, "removedFromStage_handler path:", _path, "smoothing:", _smoothing);
//    }
    
    override public function get width():Number {
        if (mcSize) return mcSize.width;
        return super.width;
    }
    
    override public function get height():Number {
        if (mcSize) {
            //if(DebugUtils.isInterestingString(path)) Cc.berryc(this, "mcSize.height", mcSize.height);
            return mcSize.height;
        }
        //if(DebugUtils.isInterestingString(path)) Cc.berryc(this, "super.height", super.height);
        return super.height;
    }
    
    protected var _isCentered:Boolean = false;
    
    [Inspectable]
    public function get isCentered():Boolean {
        return _isCentered;
    }
    
    public function set isCentered(value:Boolean):void {
        if (_isCentered != value) {
            _isCentered = value;
            if (_bitmaps) {// in case it is called from derived constructor before super()
                var len:int = _bitmaps.length;
                for (var i:int = 0; i < len; i++) {
                    _bitmaps[i].isCentered = value;
                }
            }
        }
    }
    
    protected var _isLoaded:Boolean;
    
    public function get isLoaded():Boolean {
        return _isLoaded;
    }
    
    protected var _opacity:Number = 1;
    
    [Inspectable(defaultValue="1")]
    public function get opacity():Number {
        return _opacity;
    }
    
    public function set opacity(value:Number):void {
        _opacity = value;
        if (_bitmaps) {// in case it is called from derived constructor before super()
            var len:int = _bitmaps.length;
            for (var i:int = 0; i < len; i++) {
                _bitmaps[i].alpha = _opacity;
            }
        }
    }
    
    protected var _path:String;
    
    public function get path():String {
        return _path;
    }
    
    public function get bitmap():Bitmap {
        if (_bitmaps.length == 0) return null;
        return _bitmaps[0];
    }
    
    public function get bitmapData():BitmapData {
        if (_bitmaps.length == 0) return null;
        return _bitmaps[0].bitmapData;
    }
    
    protected function get _isHorizontallyCentered():Boolean {
        return _isCentered;
    }
    
    protected function get _isVerticallyCentered():Boolean {
        return _isCentered;
    }
    
    protected var _pathList:Array;
    
    protected function get pathList():Array {
        if (_path == null) return [];
        if (_pathList == null) {
            var parts:Array = _path.split("##");
            _pathList = parts[0].split("#");
        }
        return _pathList;
    }
    
    override public function getBounds(targetCoordinateSpace:DisplayObject):Rectangle {
        if (mcSize) {
            return mcSize.getBounds(targetCoordinateSpace);
        }
        return super.getBounds(targetCoordinateSpace);
    }
    
    //	## - divides actual path list and default path.
    //	Default path is loaded when there is only one actual path it fails to load
    //	# - separates paths in the actual path list
    //	example:
    //	"icon/plane_bottom.dds#icon/plane_top.dds##icon/default_plane.dds
    public function load(path:String, smoothing:Boolean = true):void {
        if (_path == path && _smoothing == smoothing) return;

//        if (DebugUtils.isInterestingString(path)) Cc.berrycw(this, "load", DebugUtils.set("path", _path, path), DebugUtils.set("smoothing", _smoothing, smoothing, name));

//        if(DebugUtils.isInterestingString(path)) {
//            path = "imageSlides/missionsSpecials/premiumPilotMissions_JAFEB.dds";
//            Cc.berryc(this, "load OVERRIDED", path);
//        }
        
        _pathList = null;
        _isLoaded = false;
        _smoothing = smoothing;
        _path = path;
        
        updateContent();
    }
    
    public function loadOnlyLast(path:String, smoothing:Boolean = true):void {
//        if (DebugUtils.isInterestingString(path)) Cc.berrycw(this, "loadOnlyLast", DebugUtils.set("path", _path, path), DebugUtils.set("smoothing", _smoothing, smoothing, name));
        _pathList = null;
        _isLoaded = false;
        _smoothing = smoothing;
        _path = path.substring(path.lastIndexOf("#") + 1);
        
        updateContent();
    }
    
    public function clear():void {
//        if (DebugUtils.isInterestingString(path)) Cc.redcw(this, "clear", DebugUtils.set("path", _path, null, name));
        _isLoaded = false;
        _path = null;
        removeEventListener(Event.ENTER_FRAME, itemLoadedHandler);
        
        var len:int = _bitmaps.length;
        for (var i:int = 0; i < len; i++) {
            _bitmaps[i].clear();
        }
    }
    
    public function onError():void {
        error( "BitmapLoader <> failed to load", _path);
        
        var defaultPath:String = getDefaultPath();
        if (pathList.length == 1 && defaultPath != null) {
            error( "BitmapLoader <> loading default image", defaultPath);
            load(defaultPath, _smoothing);
        } else {
            onErrorLoad.fire();
            onErrorLoad.dispose();
        }
    }
    
    protected function getDefaultPath():String {
        if (_path == null) return null;
        var parts:Array = _path.split("##");
        if (parts.length > 1) return parts[1];
        return null;
    }
    
    protected function updateContent():void {
        var len:int = pathList.length;
        var i:int = 0;
        
        var anyLoaded:Boolean = false;
        var allLoaded:Boolean = true;
        
        for (i; i < len; i++) {
            if (_bitmaps.length <= i) {
                var bmp:BitmapAutoLoader = new BitmapAutoLoader();
                bmp.onLoaded.add(invalidate);
                bmp.lockSize = lockSize;
                bmp.onErrorLoad.add(onError);
                bmp.isHorizontallyCentered = _isHorizontallyCentered;
                bmp.isVerticallyCentered = _isVerticallyCentered;
                bmp.alpha = _opacity;
                bmp.smoothing = _smoothing;
                _bitmaps.push(bmp);
                addChild(bmp);
            }
            _bitmaps[i].load(pathList[i], _originalWidth, _originalHeight);
            anyLoaded ||= _bitmaps[i].isLoaded;
            if (!_bitmaps[i].isLoaded) {
                allLoaded = false;
            }
        }
        
        while (_bitmaps.length > i) {
            bmp = _bitmaps.pop();
            bmp.clear();
            bmp.onLoaded.remove(invalidate);
            bmp.onErrorLoad.remove(onError);
            safeRemove(bmp);
        }
        
        len = _bitmaps.length;
        for (i = 0; i < len; i++) {
            _bitmaps[i].visible = anyLoaded;
        }
        
        if (allLoaded) {
            itemLoadedHandler(null);
        }
    }
    
    protected function loadedHandler():void {
        dispatchEvent(new Event("resourceLoaded", true));
        onLoaded.fire();
        onLoadedOnce.fire();
        onLoadedOnce.dispose();
    }
    
    private function invalidate():void {
        addEventListener(Event.ENTER_FRAME, itemLoadedHandler, false, 0, true);
    }
    
    private function itemLoadedHandler(e:Event):void {
        removeEventListener(Event.ENTER_FRAME, itemLoadedHandler);
        var len:int = _bitmaps.length;
        for (var i:int = 0; i < len; i++) {
            if (!_bitmaps[i].isLoaded) return;
        }
        for (i = 0; i < len; i++) {
            _bitmaps[i].visible = true;
        }
        _isLoaded = true;
        loadedHandler();
    }
}
}

import com.junkbyte.console.Cc;

import flash.display.Bitmap;
import flash.display.BitmapData;

import wowp.utils.data.binding.Signal;
import wowp.utils.debug.DebugUtils;
import wowp.utils.display.cache.Cache;
import wowp.utils.display.cache.ICacheClient;
import wowp.utils.domain.createObject;

class BitmapAutoLoader extends Bitmap implements ICacheClient {
    private static const _empty:BitmapData = new BitmapData(1, 1);
    public const onErrorLoad:Signal = new Signal();
    public const onLoaded:Signal = new Signal();
    protected var _originalWidth:Number = 1;
    protected var _originalHeight:Number = 1;
    
    private var _lockSize:Boolean = false;
    
    public function get lockSize():Boolean {
        return _lockSize;
    }
    
    public function set lockSize(value:Boolean):void {
        if (_lockSize != value) {
            _lockSize = value;
            draw();
        }
    }
    
    private var _isHorizontallyCentered:Boolean = false;
    
    public function set isHorizontallyCentered(value:Boolean):void {
        if (_isHorizontallyCentered != value) {
            _isHorizontallyCentered = value;
            draw();
        }
    }
    
    private var _isVerticallyCentered:Boolean = false;
    
    public function set isVerticallyCentered(value:Boolean):void {
        if (_isVerticallyCentered != value) {
            _isVerticallyCentered = value;
            draw();
        }
    }
    
    protected var _path:String;
    
    public function get path():String {
        return _path
    }
    
    private var _isLoaded:Boolean;
    
    public function get isLoaded():Boolean {
        return _isLoaded;
    }
    
    public function get isCentered():Boolean {
        return _isHorizontallyCentered && _isVerticallyCentered;
    }
    
    public function set isCentered(value:Boolean):void {
        isHorizontallyCentered = value;
        isVerticallyCentered = value;
    }
    
    public function load(path:String, originalWidth:Number, originalHeight):void {
//        if (DebugUtils.isInterestingString(path)) Cc.redcw(this, "load", DebugUtils.set("path", _path, path), DebugUtils.set("originalWidth", _originalWidth, originalWidth), DebugUtils.set("originalHeight", _originalHeight, originalHeight));
        _originalWidth = originalWidth;
        _originalHeight = originalHeight;
        _isLoaded = false;
        if (path) {
            _path = path;
            if (_path.indexOf("/") > -1 || _path.indexOf("\\") > -1) {
//                if (DebugUtils.isInterestingString(_path)) Cc.redc(this, "Cache.getResource(_path, this);");
                Cache.getResource(_path, this);
            } else {
//                if (DebugUtils.isInterestingString(_path)) Cc.redc(this, "onResourceLoaded(createObject(_path));");
                onResourceLoaded(createObject(_path));
            }
        }
    }
    
    public function onResourceLoaded(resource:Object):void {
//        if (DebugUtils.isInterestingString(_path)) Cc.redcw(this, "onResourceLoaded:", resource);
        bitmapData = resource as BitmapData;
        _isLoaded = true;
        draw();
        onLoaded.fire();
    }
    
    public function onError():void {
        onErrorLoad.fire();
    }
    
    public function clear():void {
        if (_path) {
            Cache.releaseClient(_path, this);
        }
        visible = false;
        _path = null;
        _isLoaded = false;
        bitmapData = _empty;
    }
    
    protected function draw():void {
        if (!_isLoaded) return;
//        if (DebugUtils.isInterestingString(_path)) Cc.purplecw(this, "draw _path:", _path, "_isLoaded:", _isLoaded, "_lockSize:", _lockSize, "_isHorizontallyCentered:", _isHorizontallyCentered, "_isVerticallyCentered:", _isVerticallyCentered);
        if (_lockSize) {
            scaleX = 1;
            scaleY = 1;
            var w:Number = _originalWidth / width;
            var h:Number = _originalHeight / height;
//            if (DebugUtils.isInterestingString(_path)) Cc.purplec(this, "height", h, _originalHeight, height);
            if (w > h) {
//                if (DebugUtils.isInterestingString(_path)) Cc.purplec(this, "w > h");
                scaleX = scaleY = h;
                x = int((_originalWidth - width) / 2);
                y = 0;
            } else {
                scaleX = scaleY = w;
                x = 0;
                y = int((_originalHeight - height) / 2);
            }
        }
        if (_isHorizontallyCentered) {
            x = int(-width / 2);
        }
        if (_isVerticallyCentered) {
            y = int(-height / 2);
        }
//        if (DebugUtils.isInterestingString(_path)) Cc.yellowc(this, "x:", x, "y:", y, "scaleX:", scaleX);
    }
}
