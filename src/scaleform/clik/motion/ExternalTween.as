/**
 * Light-weight tween class specifically designed for use with GFx and CLIK.
 *
 * Usage:
 * var tween1:ExternalTween = new ExternalTween(1000, myObject, {x:250, y:250, alpha:0}, {paused:false, ease:Strong.easeOut, onComplete:handleTweenComplete, loop:true});
 */

/**************************************************************************
 
 Filename    :   ExternalTween.as
 
 Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.
 
 Use of this software is subject to the terms of the Autodesk license
 agreement provided at the time of installation or download, or which
 otherwise accompanies this software in either electronic or hard copy form.
 
 **************************************************************************/

package scaleform.clik.motion
{
	
	import fl.motion.easing.Back;
	import fl.motion.easing.Cubic;
	import fl.motion.easing.Elastic;
	import fl.motion.easing.Quadratic;
	
	import flash.display.Stage;
	import flash.external.ExternalInterface;
	
	internal class ExternalTween implements ITween
	{
		internal static const TWEEN_EXTENSION_CALL:String = "cpp_extension_call_tween";
		internal static const TWEEN_METHOD_TO:int = 0;
		internal static const TWEEN_METHOD_KILL:int = 1;
		internal static const TWEEN_METHOD_PAUSE:int = 2;
		internal static const TWEEN_METHOD_POSITION:int = 3;
		
		public static const EASE_LINEAR:int = 0;
		public static const EASE_OUT_QUAD:int = 1;
		public static const EASE_IN_QUAD:int = 2;
		public static const EASE_IN_OUT_QUAD:int = 3;
		
		protected static var degToRad:Number = 1 / 180 * Math.PI;
		
		/** Removes all tweens from the list and stops execution. */
		public static function removeAllTweens():void {
		}
		
		protected var id:Number;
		private var _target:Object;               // The object to be tweened.
		protected var ease:Function;               // This is the easing function
		
		protected var _onComplete:Function = null;         // This closure will be called when the Tween finishes
		protected var _onChange:Function = null;           // This closure will be called when the Tween updates its values (every tick/frame)
		private var _data:Object;                 // Any custom data you want to attach to the Tween (this doesn't affect its behavior in any way)
		protected var delay:Number = 0;              // Delay the tween by x number of milli-seconds
		protected var _paused:Boolean = false;
		
		private var parent:Tween;
		
		/**
		 * Create a new ExternalTween.
		 * @param duration The duration of the tween in milliseconds.
		 * @param target The DisplayObject to be tweened.
		 * @param finishProps An Object containing the properties and values that should be tweened to.
		 * @param quickSet An Object containing properties for the tween including paused, ease, onComplete, delay, data.
		 */
		public function ExternalTween(parent:Tween, duration:Number, target:Object = null, finishProps:Object = null,
									  quickSet:Object = null)
		{
			this.parent = parent
			this._target = target;
			var easing:int = 0;
			var delay:Number = 0.0;
			
			if (quickSet != null) {
				this._onComplete = quickSet.onComplete;
				this._onChange = quickSet.onChange;
				this._data = quickSet.data;
				easing = convertEasy(quickSet.ease);
				delay = quickSet.delay != null ? quickSet.delay : 0;
				if (quickSet.frameBased == true) {
					duration = duration * 1000.0 / TweenGlobalSettings.stage.frameRate;
				}
			}
			
			if (target != null) {
				var startProps:Object = currentProps(finishProps);
				this.id = ExternalInterface.call(
						TWEEN_EXTENSION_CALL,
						TWEEN_METHOD_TO,
						target,
						this.onComplete,
						duration / 1000.0,
						delay / 1000.0,
						easing,
						startProps,
						finishProps,
						this._onChange != null ? this.onChange : null
				);
			}
		}
		
		protected function convertEasy(easy:Function):int
		{
			if (easy == Cubic.easeInOut || easy == Back.easeInOut || easy == Quadratic.easeInOut || easy == Elastic.easeInOut) {
				return EASE_IN_OUT_QUAD;
			}
			if (easy == Cubic.easeIn || easy == Back.easeIn || easy == Quadratic.easeIn || easy == Elastic.easeIn) {
				return EASE_IN_QUAD;
			}
			if (easy == Cubic.easeOut || easy == Back.easeOut || easy == Quadratic.easeOut || easy == Elastic.easeOut) {
				return EASE_OUT_QUAD;
			}
			return EASE_LINEAR;
		}
		
		protected function onComplete():void {
			if (_onComplete != null) {
				_onComplete(parent);
			}
			doAutoDispose();
		}
		
		protected function onChange():void {
			this._onChange(parent);
		}
		
		public function get position():Number {
			return ExternalInterface.call(
					TWEEN_EXTENSION_CALL,
					TWEEN_METHOD_POSITION,
					id);
		}
		
		public function get paused():Boolean {
			return _paused;
		}
		
		public function set paused(value:Boolean):void {
			
			if (value) {
				ExternalInterface.call(
						TWEEN_EXTENSION_CALL,
						TWEEN_METHOD_KILL,
						id);
			}
			else if (_paused) {
				throw new Error("'Pause = false' has not yet been implemented");
			}
			_paused = value;
		}
		
		protected function currentProps(props)
		{
			var res:Object = {};
			for (var name:String in props) {
				var val:Number = this._target[name];
				if (isNaN(val)) {
					val = 0.0;
				}
				res[name] = val;
			}
			return res;
		}
		
		public function doAutoDispose():void
		{
			_target = null;
			_onChange = null;
			_onComplete = null;
		}
		
		public function get target():Object {
			return _target;
		}
		
		public function set target(value:Object):void {
			_target = value;
		}
		
		public function get data():Object {
			return _data;
		}
		
		public function set data(value:Object):void {
			_data = value;
		}
	}
}