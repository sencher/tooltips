package utils.wg.hyperlink
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	import wowp.account.constants.ColorConstants;
	import wowp.account.model.AccountModel;
	import wowp.achievements.awards.component.AwardTooltip;
	import wowp.achievements.vo.AwardTooltipVO;
	import wowp.controls.UIFactory;
	import wowp.core.layers.tip.helper.TipsHelperNoStage;
	import wowp.data.ivo.compound.AchievementData;
	import wowp.utils.display.safeRemove;
	import wowp.utils.string.getPhraseLocation;
	import wowp.utils.string.stringReplace;
	
	public class TextAchievementProcessor
	{
		private var _tf:TextField;
		private var _distinguishedText:String;
		private var _text:String;
		private var _overlay:Sprite;
		private var _tips:TipsHelperNoStage;
		
		public function TextAchievementProcessor(tf:TextField) {
			_tf = tf;
		}
		
		public function process(text:String=null):void {
			dispose();
			
			var pattern:RegExp = /<achievement id='(-?\d+)'>(.+)<\/achievement>/g;
			var groups:Array;
			var id:int;
			
			text = text || _tf.htmlText;
			
			groups = pattern.exec(text);
			if (groups && groups.length > 1) {
				id = groups[1];
				
				_distinguishedText = groups[2];
				_text = stringReplace(text, groups[0], "<font color='#{colorID}'>" + _distinguishedText + "</font>");

				_overlay = new Sprite();
				_overlay.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler, false, 0, true);
				_overlay.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler, false, 0, true);
				if (_tf.parent) {
					_tf.parent.addChild(_overlay);
				}
				
				_tips = new TipsHelperNoStage();
				var vo:AwardTooltipVO = new AwardTooltipVO();
				var data:AchievementData = AccountModel.instance.achievementsModel.getAchievementById(id);
				vo.name = data.name;
				vo.description = data.description;
				vo.icoPath = data.icoPath;
				vo.history = data.history;
				vo.ticketsAmount = data.tickets;
				vo.bonusGained = data.bonusGained;
				vo.multiple = data.multiple;
				vo.steps = data.steps;
				vo.level = data.level;
				
				var popInfo:AwardTooltip = UIFactory.create("AwardTooltipClass") as AwardTooltip;
				popInfo.setData(vo);
				_tips.registerStaticTip(_overlay, UIFactory.createInfoTip(popInfo, popInfo.bgPadding));
			} else {
				_tf.htmlText = text;
				return;
			}
			
			drawText(ColorConstants.TEXT_LINE_SELECTED);
		}
		
		private function drawText(color:uint):void {
			_overlay.graphics.clear();
			if (!_text) return;
			
			var text:String = stringReplace(_text, "{colorID}", color.toString(16));
			_tf.htmlText = text;
			
			if (_distinguishedText) {
				var locationArray:Array = getPhraseLocation(_distinguishedText, _tf);
				for each (var bounds:Rectangle in locationArray) {
					_overlay.graphics.beginFill(0xff0000, 0);
					_overlay.graphics.drawRect(-2, 0, bounds.width + 4, bounds.height);
					_overlay.graphics.endFill();
					_overlay.x = bounds.x + _tf.x;
					_overlay.y = bounds.y + _tf.y;
				}
			}
		}
		
		private function mouseOverHandler(e:Event):void {
			drawText(ColorConstants.TEXT_LINE_OVER);
		}
		
		private function mouseOutHandler():void {
			drawText(ColorConstants.TEXT_LINE_SELECTED);
		}
		
		private function dispose():void {
			_text = null;
			if (_overlay) {
				_overlay.graphics.clear();
				_overlay.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
				_overlay.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
				safeRemove(_overlay);
				_overlay = null;
			}
			if (_tips) {
				_tips.dispose();
				_tips = null;
			}
		}
	}
}
