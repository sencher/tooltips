package survarium {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import survarium.controls.Message;
	import survarium.data.ItemData;
	
	import survarium.hud.TabPlayersPve;
	import survarium.messages.MessageItemTradeWithInfo;
	
	[SWF(width="1400", height="800")]
public class TradeWithInfo extends Sprite {
	private var mc:MessageItemTradeWithInfo;
	private var timer:Timer = new Timer(1);
	
	protected var _top_container:MovieClip = new MovieClip();
	protected var _top2_container:MovieClip = new MovieClip();
	protected var _front_container:MovieClip = new MovieClip();
	
	public function TradeWithInfo() {
		PlayRegular;PlayBold;
		SrvButtonShared;SrvRewardRendererShared;SrvButtonRedShared;SrvItemBaseRenderer;SrvRewardBigRendererShared;
		
		stage.addChild(_front_container);
		stage.addChild(_top_container);
		stage.addChild(_top2_container);
		_top_container.name = "_top_container";
		Message.initStage(_top_container);
		Message.registerBackground(BackBlack);
		
		Message.registerMessage("tradeWithInfo", SrvMessageTradeWithInfo);
		//mc = new SrvMessageTradeWithInfo();
		
		var itemData:ItemData = new ItemData();
		itemData.name = "aaa";
		itemData.broken = false;
		itemData.isPremium = true;
		itemData.isStack   = true;
		itemData.itemDescriptor = {"buyable":true,"camo_available":false,"icon_column":1,"rarity_level":0,"clip_size":1,"decal_available":0,"double_handed":true,"faction_id":0,"text_descriptions":{"name":"Ключи доступа","description":"Ключи доступа необходимы для старта командных миссий"},"level":0,"faction_level":0,"category":27,"additional_slots":[],"fixed_ammo_size":0,"is_sellable":true,"type":"vch_drop","upgrades_available":4,"modifiers":[],"upgrades":[],"unknown_mod_count":0,"premium_cost":0,"icon":[27,1],"cost":50,"is_stack":true,"voucher_type":5,"dictId":1384,"icon_name":"1_27.png","props_list":[{}],"is_premium":true,"icon_row":27,"sell_confirm":3};
		
		var buyData:Object = {
			forceStack:true,
			dictId:0,
			seller:0,
			count:1,
			cost:70,
			itemData:itemData,
			minimum:1
		};
		
		Message.showMessage("tradeWithInfo", buyData);
		
//		mc.setMessageData()
//		addChild(mc);
		
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
