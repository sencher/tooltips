/**
 * Created by S.Senkov on 06.10.2016.
 */
package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.utils.Timer;

	public class Test_Reload extends Sprite
	{
		private var _textField:TextField = new TextField();
		private var _timer:Timer = new Timer(500,10);

		public function Test_Reload()
		{
			_textField.border = true;
			addChild(_textField);
			_timer.addEventListener(TimerEvent.TIMER, onTimer)
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete)
			_textField.addEventListener(MouseEvent.CLICK, onTFMouseClick)
			_timer.start();
		}

		private function onTimer(event:TimerEvent):void
		{
			trace("timer")
			_textField.text = String(Math.random() * 10);
		}

		private function onTimerComplete(event:TimerEvent):void
		{
			trace("comp")
		}

		private function onTFMouseClick(event:MouseEvent):void
		{
			resetMe();
		}

		public function resetMe():void {

			var url:String = stage.loaderInfo.url;
			trace("resetMe",url);
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request,"_level0");
		}
	}
}
