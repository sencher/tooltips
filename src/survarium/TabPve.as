package survarium {
import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import survarium.hud.TabPlayersPve;

[SWF(width="1400", height="800")]
public class TabPve extends Sprite {
	private var tab:TabPlayersPve;
	private var timer:Timer = new Timer(1);
	public function TabPve() {
		PlayRegular;PlayBold;
		tab = new SrvTabPlayersPve();
		var _players:Array = [
			{"name":"NE\nsencher","team":1},
			{"name":"mmsss","team":1,"alive":true},
			{"name":"zzxc22213qq","team":1,"alive":false},
			{"name":"NE\ntutorialibotlibattery","team":2},
			{"name":"444ddd","team":1}
		];
		tab.listSetPlayers(_players);
		tab.collectedChests(26);
		tab.totalChests(71);
		tab.setObjectives("sfdifbjrifbrjfbrejfbjreftrejn r rfnkn konoer jjeo je r\n sdfsfdsfsefdsf\nsfdsfserres")
		tab.updateTitleText("sfdifbjrifbrjfbrejfbjreftrejn r rfnkn konoer jjeo je r\n sdfsfdsfsefdsf\nsfdsfserres")
		addChild(tab);
		
		tab.addEventListener(MouseEvent.CLICK, onClick);
		timer.addEventListener(TimerEvent.TIMER, onTimer);
		//timer.start();
	}
	
	private function onTimer(event:TimerEvent):void {
		randomChange();
	}
	
	private function onClick(event:MouseEvent):void {
		randomChange();
	}
	
	private function randomChange():void {
		tab.updatePlayerValue(Util.getRandom(0,2), "alive", Util.getRandom(0,1));
	}
}
}
