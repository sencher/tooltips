/**
 * Created by S.Senkov on 06.02.2017.
 */
package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
[SWF(width=1200,height=500)]
	public class Test_CirclesElipse extends Sprite
	{
	private const X1:Number = 200;
	private const Y1:Number = 250;
	private const X2:Number = 800;
	private const Y2:Number = 250;
	private const RADIUS:Number = 60;
	private const RADIUS_MIN:Number = 30;
		public function Test_CirclesElipse()
		{
//			var line:Shape = new Shape();
//			line.graphics.moveTo(0, 250);
//			line.graphics.lineTo(1200, 250);
//			addChild(line);
			generateCircles(X1,Y1,X2,Y2,RADIUS);
			
			var myShape:Shape = new Shape();
			myShape.graphics.lineStyle(2, 0x990000, .75);
			myShape.graphics.beginFill(0x00FF00);
			myShape.graphics.moveTo(X1, Y1);
			myShape.graphics.lineTo(X2, Y2);
			addChild(myShape);
//			extracted(50,50,50);
			
			
		}
	
	private function draw(x:int,y:int,r:int):void
	{
		trace(arguments)
		var circle:Sprite = new Sprite();
		circle.graphics.beginFill(0xFF794B);
		circle.graphics.drawCircle(x, y, r);
		circle.graphics.endFill();
		addChild(circle);
	}
	
	private function getLength(x1:int, y1:int, x2:int, y2:int):Number{
		return Math.sqrt(Math.pow(x2-x1,2) + Math.pow(y2-y1,2));
	}
		
		private function generateCircles(x1:int, y1:int, x2:int, y2:int, width:int):Array {
			var length:Number = getLength(x1,y1,x2,y2);
			var steps:int = 70;
			var curX:int = x1;
			var curY:int = y1;
			var curR:int = RADIUS_MIN;
			var dx:int = x2-x1-RADIUS_MIN*2;
			var dy:int = y2-y1;
			var dr:int = RADIUS - RADIUS_MIN;
			var lenghtFromCenter:Number;
			var maxLenghtFromCenter:Number = length/2 - RADIUS_MIN;
			var centerX:int = x1 + (x2-x1)/2;
			var centerY:int = y1 + (y2-y1)/2;
			for(var i:int = 0; i<steps; i++){
				curX = x1 + length*i/steps;
//				lenghtFromCenter = getLength(curX,curY,centerX,centerY);
//				var coef = (maxLenghtFromCenter - lenghtFromCenter)/(maxLenghtFromCenter);
//				trace(coef)
//				curR = coef*dr + RADIUS_MIN;
				//радиус = sqrt(1-(x^2)/(a^2))/b
				curR = Math.sqrt(1-Math.pow(curX-500,2)/Math.pow(length/2,2))*RADIUS;
				
//				curR = RADIUS_MIN + dr*i/(steps/2-1);
				draw(curX,y1+dy*i/(steps-1),curR);
//				_layers.push(new BackgroundStaticItem(Global.getGameWorld(),new Vector2D(x,y),0.7,"Red"/*+r*/,"background",4));
//				x += dx;
//				y += dy;
			}

			return [];
		}
	}
}
