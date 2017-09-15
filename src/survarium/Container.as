package survarium {
import flash.display.Sprite;

import survarium.hud.TabPlayersPve;

[SWF(width="1920", height="800")]
public class Container extends Sprite {
	private var tab:TabPlayersPve;
	public function Container() {
		PlayRegular;PlayBold;
		tab = new SrvTabPlayersPve();
		var _players:Array = [
			{"name":"NE\nsencher","team":1},
			{"name":"mmsss","team":1},
			{"name":"zzxc22213qq","team":1},
			{"name":"NE\ntutorialibotlibattery","team":2},
			{"name":"444ddd","team":1}
		];
		tab.listSetPlayers(_players);
		tab.collectedChests(26);
		tab.totalChests(71);
		tab.setObjectives("sfdifbjrifbrjfbrejfbjreftrejn r rfnkn konoer jjeo je r\n sdfsfdsfsefdsf\nsfdsfserres")
		tab.updateTitleText("sfdifbjrifbrjfbrejfbjreftrejn r rfnkn konoer jjeo je r\n sdfsfdsfsefdsf\nsfdsfserres")
		addChild(tab);
	}
}
}
