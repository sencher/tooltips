package survarium {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import scaleform.clik.events.IndexEvent;
	
	import survarium.controls.Message;
	import survarium.controls.NumericStepperLabel;
	import survarium.data.ItemData;
	
	import survarium.hud.TabPlayersPve;
	import survarium.messages.MessageItemTradeWithInfo;
	
	[SWF(width="1400", height="800")]
public class TradeWithInfo2 extends Sprite {
	private var mc:TestSrvMessageTradeWithInfo;
		private var slider:NumericStepperLabel;
	private var timer:Timer = new Timer(1);
	
	protected var _top_container:MovieClip = new MovieClip();
	protected var _top2_container:MovieClip = new MovieClip();
	protected var _front_container:MovieClip = new MovieClip();
		
		private var totalGold:int = 221;
		private var _totalCost:int;
		private var _cost:int = 50;
	
	public function TradeWithInfo2() {
		PlayRegular;PlayBold;
		SrvButtonShared;SrvRewardRendererShared;SrvButtonRedShared;SrvItemBaseRenderer;SrvRewardBigRendererShared;

		mc = new TestSrvMessageTradeWithInfo();
		slider = mc.slider;
		addChild(mc);
		
//		mc.addEventListener(MouseEvent.CLICK, onClick);
//		timer.addEventListener(TimerEvent.TIMER, onTimer);
		//timer.start();
		mc.info_tf.htmlText = '<font color="#0000ff">BLUE</font><font color="#00ff00">GREEN</font>';
		slider.minimum = 1;
		slider.maximum = int(totalGold / _cost);
		slider.editable = true;
		slider.value = 1;
		slider.addEventListener(IndexEvent.INDEX_CHANGE, onSliderUpdate);
	}
	
	//При обновлении слайдера
	protected function onSliderUpdate(event:IndexEvent = null):void {
		var sliderpos:int = slider.value;
		//trace("ammount::", sliderpos, _cost);
		_totalCost = sliderpos * _cost;
//		if(_totalCost > totalGold){
//			slider.value = totalGold % _cost - 1;
//		}
		slider.label = _totalCost.toString();
		
		// updateButtonEnabled();
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
