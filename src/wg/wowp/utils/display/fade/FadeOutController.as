package wowp.utils.display.fade {

import fl.motion.easing.Cubic;

import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.geom.Point;
import flash.utils.setTimeout;

import scaleform.clik.motion.Tween;

import wowp.core.eventPipe.EventPipe;

import wowp.utils.data.binding.Signal;
import wowp.utils.display.safeRemove;

public class FadeOutController {
    public const onComplete:Signal = new Signal();
    private const DURATION:int = 700;
    private var _content:Sprite;
    private var _targetPoint:Point;
    private var _holder:Sprite;
    private var _wrapper:Sprite;
    private var _contentTween:Tween;
    private var _event:String;
    
    public function FadeOutController(stage:Stage, sprite:Sprite, targetPoint:Point, event:String = null) {
        _content = sprite;
        _targetPoint = targetPoint;
        _event = event;
        startAnimation(stage);
    }
    
    private function startAnimation(stage:Stage):void {
        _holder = new Sprite();
        _wrapper = new Sprite();
        
        stage.addChild(_holder);
        
        _content.cacheAsBitmap = true;
        _content.mouseChildren = false;
        _wrapper.addChild(_content);
        _holder.addChild(_wrapper);
        _holder.x = _content.x + _content.width / 2;
        _holder.y = _content.y + _content.height / 2;
        _content.x = -_content.width / 2;
        _content.y = -_content.height / 2;
        
        setTimeout(move, 500);
    }
    
    private function move():void {
        new Tween(DURATION, _holder, {x: _targetPoint.x, y: _targetPoint.y}, {ease: Cubic.easeIn});
        new Tween(DURATION, _wrapper, {scaleX: .3, scaleY: .3}, {ease: Cubic.easeOut});
        _contentTween = new Tween(DURATION, _content, {alpha: 0});
			setTimeout(completed, DURATION);
		}
		
		private function completed():void {
			if (_event) {
                new EventPipe().dispatchEvent(new Event(_event, true));
			}
			safeRemove(_content);
			onComplete.fire();
		}
		
		public function dispose():void {
			if (_contentTween) {
				_contentTween.paused = true;
				_contentTween = null;
			}
			if (_holder) {
				safeRemove(_holder);
				_holder = null;
			}
			if (_content) {
				_content.mouseChildren = true;
				_content.cacheAsBitmap = false;
				_content.alpha = 1;
				_content = null;
			}
		}
	}
}
