package survarium {
import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import survarium.hud.TabPlayersPve;
	import survarium.messages.MessageItemTradeWithInfo;
	
	[SWF(width="1400", height="800")]
public class Template extends Sprite {
	private var mc:MessageItemTradeWithInfo;
	private var timer:Timer = new Timer(1);
	public function Template() {
		PlayRegular;PlayBold;
		mc = new SrvMessageTradeWithInfo();
		var _players:Array = [
			{"name":"NE\nsencher","team":1},
			{"name":"mmsss","team":1,"alive":true},
			{"name":"zzxc22213qq","team":1,"alive":false},
			{"name":"NE\ntutorialibotlibattery","team":2},
			{"name":"444ddd","team":1}
		];
		addChild(mc);
		
//		mc.addEventListener(MouseEvent.CLICK, onClick);
//		timer.addEventListener(TimerEvent.TIMER, onTimer);
		//timer.start();
	}
	
	private function onTimer(event:TimerEvent):void {
		randomChange();
	}
	
	private function onClick(event:MouseEvent):void {
		randomChange();
	}
	
	private function randomChange():void {
//		mc.updatePlayerValue(Util.getRandom(0,2), "alive", Util.getRandom(0,1));
	}
}
}
