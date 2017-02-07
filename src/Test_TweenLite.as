/**
 * Created by S.Senkov on 06.10.2016.
 */
package
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class Test_TweenLite extends Sprite
	{
		private const RADIUS:int = 20;
		private const MAX_X:int = 400;
		private const MAX_Y:int = 300;
		private const MAX_TIME:int = 10;
		private const MAX_UNITS:int = 100;
		public function Test_TweenLite()
		{
			for (var i:int = 0; i<MAX_UNITS; i++)
				createCircle(i)
		}

		private function createCircle(id:int):void{
			var s:Sprite = new Sprite();
			s.name = String(id);
			s.graphics.beginFill(0x456789);
			s.graphics.lineStyle(2,0x987654);
			s.graphics.drawCircle(0,0,RADIUS);
			s.graphics.endFill();
			addChild(s);
			s.x = Math.random()*MAX_X;
			s.y = Math.random()*MAX_Y;
			s.addEventListener(MouseEvent.CLICK, onClick);
			start(s);
		}

		private function start(s:Sprite):void
		{
			trace("start", s.name);
			TweenLite.to(s, Math.random()*MAX_TIME, {x:Math.random()*MAX_X, y:Math.random()*MAX_Y, onComplete:start,onCompleteParams:[s]});
		}

		private function onClick(event:MouseEvent):void
		{
			var curTarget:Sprite = Sprite(event.currentTarget);
			trace("click", curTarget.name);
			if(event.ctrlKey)
				TweenMax.killAll();
			else
				TweenMax.killTweensOf(curTarget);
		}
	}
}
