package utils.wg.utils.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import wowp.utils.data.binding.Signal;
	
	public class BitmapLoader extends Sprite
	{
		public const onLoaded:Signal = new Signal();
		public const onErrorLoad:Signal = new Signal();
		public const onLoadedOnce:Signal = new Signal();
		
		public var mcSize:MovieClip;
		
		protected var _isCentered:Boolean = false;
		protected var _isLoaded:Boolean;
		protected var _opacity:Number = 1;
		
		public function get isLoaded():Boolean {return _isLoaded;}
		
		[Inspectable]
		public function get isCentered():Boolean {return _isCentered;}
		
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
		
		protected function get _isHorizontallyCentered():Boolean {return _isCentered;}
		
		protected function get _isVerticallyCentered():Boolean {return _isCentered;}
		
		[Inspectable]
		public var lockSize:Boolean = false;
		
		[Inspectable(defaultValue="1")]
		public function get opacity():Number {return _opacity;}
		
		public function set opacity(value:Number):void
		{
			_opacity = value;
			if (_bitmaps) {// in case it is called from derived constructor before super()
				var len:int = _bitmaps.length;
				for (var i:int = 0; i < len; i++) {
					_bitmaps[i].alpha = _opacity;
				}
			}
		}
		
		protected const _bitmaps:Vector.<BitmapAutoLoader> = new Vector.<BitmapAutoLoader>();
		
		protected var _originalWidth:Number = 1;
		protected var _originalHeight:Number = 1;
		protected var _smoothing:Boolean;
		protected var _path:String;
		
		public function get path():String {return _path;}
		
		public function get bitmap():Bitmap {
			if (_bitmaps.length == 0) return null;
			return _bitmaps[0];
		}
		
		public function get bitmapData():BitmapData {
			if (_bitmaps.length == 0) return null;
			return _bitmaps[0].bitmapData;
		}
		
		public function BitmapLoader()
		{
			_originalHeight = height;
			_originalWidth = width;
			if (scaleX != 1) scaleX = 1;
			if (scaleY != 1) scaleY = 1;
		}
		
		//	## - divides actual path list and default path.
		//	Default path is loaded when there is only one actual path it fails to load
		//	# - separates paths in the actual path list
		//	example:
		//	"icon/plane_bottom.dds#icon/plane_top.dds##icon/default_plane.dds
		public function load(path:String, smoothing:Boolean = true):void
		{
			_pathList = null;
			_isLoaded = false;
			_smoothing = smoothing;
			_path = path;
			
			updateContent();
		}
		
		protected function getDefaultPath():String {
			if (_path == null) return null;
			var parts:Array = _path.split("##");
			if (parts.length > 1) return parts[1];
			return null;
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
		
		protected function loadedHandler():void {
			dispatchEvent(new Event("resourceLoaded", true));
			onLoaded.fire();
			onLoadedOnce.fire();
			onLoadedOnce.dispose();
		}
		
		public function clear():void
		{
			_isLoaded = false;
			_path = null;
			removeEventListener(Event.ENTER_FRAME, itemLoadedHandler);
			
			var len:int = _bitmaps.length;
			for (var i:int = 0; i < len; i++) {
				_bitmaps[i].clear();
			}
		}
		
		public function onError():void
		{
			trace("[ERROR] BitmapLoader: failed to load", _path);
			
			var defaultPath:String = getDefaultPath();
			if (pathList.length == 1 && defaultPath != null) {
				trace("[ERROR] BitmapLoader: loading default image", defaultPath);
				load(defaultPath, _smoothing);
			} else {
				onErrorLoad.fire();
				onErrorLoad.dispose();
			}
		}
		
		override public function get width():Number {
			if (mcSize) return mcSize.width;
			return super.width;
		}
		
		override public function get height():Number {
			if (mcSize) return mcSize.height;
			return super.height;
		}
		
		override public function getBounds(targetCoordinateSpace:DisplayObject):Rectangle {
			if (mcSize) {
				return mcSize.getBounds(targetCoordinateSpace);
			}
			return super.getBounds(targetCoordinateSpace);
		}
	}
	
}

import flash.display.Bitmap;
import flash.display.BitmapData;

import wowp.utils.data.binding.Signal;
import wowp.utils.display.cache.Cache;
import wowp.utils.display.cache.ICacheClient;
import wowp.utils.domain.createObject;

class BitmapAutoLoader extends Bitmap implements ICacheClient
{
	private static const _empty:BitmapData = new BitmapData(1, 1);
	
	public const onLoaded:Signal = new Signal();
	public const onErrorLoad:Signal = new Signal();
	
	private var _lockSize:Boolean = false;
	private var _isHorizontallyCentered:Boolean = false;
	private var _isVerticallyCentered:Boolean = false;
	
	protected var _originalWidth:Number = 1;
	protected var _originalHeight:Number = 1;
	protected var _path:String;
	private var _isLoaded:Boolean;
	
	public function get isLoaded():Boolean {return _isLoaded;}
	
	public function get lockSize():Boolean {return _lockSize;}
	
	public function set lockSize(value:Boolean):void {
		if (_lockSize != value) {
			_lockSize = value;
			draw();
		}
	}
	
	public function get isCentered():Boolean {return _isHorizontallyCentered && _isVerticallyCentered;}
	
	public function set isCentered(value:Boolean):void {
		isHorizontallyCentered = value;
		isVerticallyCentered = value;
	}
	
	public function set isHorizontallyCentered(value:Boolean):void {
		if (_isHorizontallyCentered != value) {
			_isHorizontallyCentered = value;
			draw();
		}
	}
	
	public function set isVerticallyCentered(value:Boolean):void {
		if (_isVerticallyCentered != value) {
			_isVerticallyCentered = value;
			draw();
		}
	}
	
	public function get path():String {
		return _path
	}
	
	public function load(path:String, originalWidth:Number, originalHeight):void {
		_originalWidth = originalWidth;
		_originalHeight = originalHeight;
		_isLoaded = false;
		if (path) {
			_path = path;
			if (_path.indexOf("/") > -1 || _path.indexOf("\\") > -1) {
				Cache.getResource(_path, this);
			} else {
				onResourceLoaded(createObject(_path));
			}
		}
	}
	
	public function onResourceLoaded(resource:Object):void {
		bitmapData = resource as BitmapData;
		_isLoaded = true;
		draw();
		onLoaded.fire();
	}
	
	protected function draw():void {
		if (!_isLoaded) return;
		if (_lockSize) {
			scaleX = 1;
			scaleY = 1;
			var w:Number = _originalWidth / width;
			var h:Number = _originalHeight / height;
			if (w > h) {
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
	
}
