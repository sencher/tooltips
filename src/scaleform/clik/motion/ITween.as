package scaleform.clik.motion {
	public interface ITween {
		function get position():Number;
		function get paused():Boolean;
		function set paused(value:Boolean):void;
		function get target() : Object;
		function set target(value : Object) : void;
		function get data() : Object;
		function set data(value : Object) : void;
		function doAutoDispose():void;
	}
}
