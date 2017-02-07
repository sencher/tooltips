package {
	import flash.display.Sprite;
	import flash.display.Shape;
	
	public class Test_Ellipse extends Sprite
	{
		public static const SMALL:uint = 0;
		public static const MEDIUM:uint = 1;
		public static const LARGE:uint = 2;
		
		public function Test_Ellipse()
		{
			drawEgg(SMALL, 0, 100);
			drawEgg(MEDIUM, 100, 60);
			drawEgg(LARGE, 250, 35);
		}
		
		public function drawEgg(eggSize:uint, x:Number, y:Number):void  {
			
			var myEgg:Shape = new Shape();
			
			myEgg.graphics.beginFill(0xFFFFFF);
			myEgg.graphics.lineStyle(1);
			
			switch(eggSize) {
				case SMALL:
					myEgg.graphics.drawEllipse(x, y, 40, 70);
					break;
				case MEDIUM:
					myEgg.graphics.drawEllipse(x, y, 120, 150);
					break;
				case LARGE:
					myEgg.graphics.drawEllipse(x, y, 150, 200);
					break;
				default:
					trace ("Wrong size! There is no egg.");
					break;
			}
			
			myEgg.graphics.endFill();
			
			this.addChild(myEgg);
		}
	}
}