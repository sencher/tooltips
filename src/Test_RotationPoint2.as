/**
 * Created by S.Senkov on 07.02.2017.
 */
package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	
	public class Test_RotationPoint2 extends Sprite
	{
		private var box:Sprite = new Sprite();
		private var ellipse:Sprite = new Sprite();
		private var WIDTH:int = 50;
		private var HEIGHT:int = 70;
		
		public function Test_RotationPoint2()
		{
			box.graphics.beginFill(0xFFFFFF);
			box.graphics.drawRect(-WIDTH/2, -HEIGHT/2, WIDTH, HEIGHT);
			box.filters = [new GlowFilter(0xFF6699, .80, 5, 5, 2, 2, false, false)];
			box.graphics.endFill();
			box.x = 100;
			box.y = 100;
			stage.addChild(box);
			
			ellipse.graphics.beginFill(0xFFFFFF);
			ellipse.graphics.drawEllipse(-WIDTH/2, -HEIGHT/2, WIDTH, HEIGHT);
			ellipse.filters = [new GlowFilter(0xFF6699, .80, 5, 5, 2, 2, false, false)];
			ellipse.graphics.endFill();
			ellipse.x = 200;
			ellipse.y = 200;
			stage.addChild(ellipse);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			box.rotation += 3;
			ellipse.rotation += 3;
		}
	}
}
