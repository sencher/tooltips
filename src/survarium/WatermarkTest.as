package survarium {
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	import survarium.hud.TabPlayersPve;
	import survarium.hud.Watermark;
	import survarium.messages.MessageItemTradeWithInfo;
	
	import utils.Utils;
	
	[SWF(width="1400", height="800", backgroundColor="0x999999")]
	public class WatermarkTest extends Sprite {
		private var mc:Watermark;
		private var timer:Timer = new Timer(1);
		private var data1:Object = {
			rows:[
				"Начальник конвоя СИЗО Бахмутского отдела полиции в Донецкой области задержан за продажу семи кг ртути.  Об этом сообщает пресс-служба областной прокуратуры.",
				"Правоохранителям о намерении полицейского продать опасное вещество рассказал местный житель.",
				"Начальника конвоя изолятора временного содержания задержали сразу после продажи семи кг ртути. При задержании у него изъяли заранее идентифицированные 10 тыс. гривен, полученные им от продажи опасного вещества.",
				"Продолжается досудебное расследование, решается вопрос об объявлении подозрения задержанному и избрании в отношении него меры пресечения."
			],
			x:0.25,
			y:0.25,
			color:0xFF0000,
			alpha:0.25,
			liveTime:1
		};
		
		private var data2:Object = {
			rows:[
				"So I was using the color picker component that comes with the Flash IDE.",
				"When the user selects a color, the color picker fire a ColorPickerEvent.CHANGE",
				"event and from that event you can access the new color that was chosen.",
				"The format of this color is a uint; when working with colors I am more used to the hexadecimal format."
			],
			x:0.5,//Math.random(),
			y:0.5,//Math.random(),
			color:0x00FF00,
			alpha:0.5,
			liveTime:1
		};
		
		private var data3:Object = {
			rows:[
				"The color you get from the color picker component is in the RGB format, so no transparency.",
				"If you want to add an alpha channel to that color (converting it to ARGB),",
				"let’s say to use the setPixel32 method of the BitmapData class  and produce Bitmap with transparency,",
				"you’re going to have to modify the uint you can do so using this simple function (AS3):"
			],
			x:0.75,//Math.random(),
			y:0.75,//Math.random(),
			color:0x0000FF,
			alpha:0.75,
			liveTime:1
		};
		
		public function WatermarkTest() {
			PlayRegular;PlayBold;
			mc = new SrvWatermark();
			
			addChild(mc);

			stage.addEventListener(MouseEvent.CLICK, onClick);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	//		timer.addEventListener(TimerEvent.TIMER, onTimer);
			//timer.start();
			mc.setData(data1);
		}
		
		
		
		private function onKeyUp(event:KeyboardEvent):void {
			switch (event.keyCode){
				case Keyboard.NUMBER_1:
					mc.setData(data1);
					break;
				case Keyboard.NUMBER_2:
					mc.setData(data2);
					break;
				case Keyboard.NUMBER_3:
					mc.setData(data3);
					break;
				case Keyboard.NUMBER_4:
					var rows:Array = [];
					var numRows:int = Utils.getRandom(0,4);
					var i:int;
					for(i=0; i<numRows; i++){
						rows.push(Utils.generateRandomString(Utils.getRandom(0,100)))
					}
					var randomData:Object = {
						rows:rows,
						x:Math.random(),
						y:Math.random(),
						color:Math.random() * 0xFFFFFF,
						alpha:Math.random(),
						liveTime:Math.random() * 5
					};
					mc.setData(randomData);
					break;
			}
		}
		
		private function onTimer(event:TimerEvent):void {
			randomChange();
		}
		
		private function onClick(event:MouseEvent):void {
			randomChange();
		}
		
		private function randomChange():void {
			mc.updatePosition(Math.random(),Math.random());
		}
	}
}
