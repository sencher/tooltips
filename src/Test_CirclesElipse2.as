/**
 * Created by S.Senkov on 06.02.2017.
 */
package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	[SWF(width=1200,height=1000)]
	public class Test_CirclesElipse2 extends Sprite
	{
	private var X1:Number = 400;
	private var Y1:Number = 400;
	private var X2:Number = 700;
	private var Y2:Number = 700;
	private var RADIUS:Number = 60;
	private var RADIUS_MIN:Number = 30;
		
	private var ELLIPSE_X:Number = 500;
	private var ELLIPSE_Y:Number = 500;
	private var ELLIPSE_WIDTH:Number = 100;
	private var ELLIPSE_HEIGHT:Number = 500;
	private var ELLIPSE_ROTATION:Number = 0;
		
	private var curRotation:Number = 0;
	private var container:Sprite = new Sprite();
		
	private var tf:TextField = new TextField();
		public function Test_CirclesElipse2()
		{
			tf.width = tf.height = 1000;
			addChild(tf);
			
//			X1 = Math.random()*1000;
//			Y1 = Math.random()*1000;
//			X2 = Math.random()*1000;
//			Y2 = Math.random()*1000;
//			RADIUS = Math.random()*60;
			
//			var debug:String ="587.4927979893982 600.4301062785089 419.62395515292883 534.6810068003833 24.36956369318068";
//			var debArray:Array = debug.split(" ");
//			X1 = debArray[0];
//			Y1 = debArray[1];
//			X2 = debArray[2];
//			Y2 = debArray[3];
//			RADIUS = debArray[4];
			
//			tf.appendText("\n " + X1 +" "+Y1 +" "+X2 +" "+Y2 +" "+RADIUS);
			tf.width = tf.height = 1000;
			addChild(tf);
			addChild(container)
			
			drawEllipse(ELLIPSE_X,ELLIPSE_Y,ELLIPSE_WIDTH,ELLIPSE_HEIGHT, ELLIPSE_ROTATION);
			
			var length:Number;
			var width:Number;
			if(ELLIPSE_HEIGHT >= ELLIPSE_WIDTH){
				length = ELLIPSE_HEIGHT;
				width = ELLIPSE_WIDTH;
			}else{
				length = ELLIPSE_WIDTH;
				width = ELLIPSE_HEIGHT;
			}
			
			//drawLine(-ELLIPSE_HEIGHT/2,ELLIPSE_Y,ELLIPSE_HEIGHT/2,ELLIPSE_Y);
			drawLine(ELLIPSE_X,ELLIPSE_Y-ELLIPSE_HEIGHT/2,ELLIPSE_X,ELLIPSE_Y+ELLIPSE_HEIGHT/2,ELLIPSE_ROTATION);
			
			generateCircles(ELLIPSE_X,Y1,ELLIPSE_X,Y2,RADIUS);
			
			addEventListener(MouseEvent.CLICK, onClick)
		}
		
		private var ellipse:Shape;
		
		private function drawEllipse(x1:Number, y1:Number, w:Number, h:Number, angle:Number):void
		{
			tf.appendText("\ndrawEllipse " + arguments.toString());
			ellipse = new Shape();
			ellipse.graphics.lineStyle(2/*, 0x990000, .75*/);
//			ellipse.graphics.beginFill(0x00FF00);
			ellipse.graphics.drawEllipse(-w/2, -h/2, w, h);
			ellipse.x = x1;
			ellipse.y = y1;
			ellipse.rotation = angle;
			/*container.*/addChild(ellipse);
//			addEventListener(MouseEvent.CLICK, onClick)
		}
		
		private function onClick(event:Event):void
		{
			line.rotation +=10;
			ellipse.rotation += 10;
//			curRotation += 10;
//			removeChild(ellipse);
//			//ellipse.rotation += 7;
//			drawEllipse(ellipse.x, ellipse.y,  ELLIPSE_WIDTH, ELLIPSE_HEIGHT, curRotation)
		}
		
		private var line:Shape = new Shape();
		
		private function drawLine(x1:Number, y1:Number, x2:Number, y2:Number, angle:Number):void
		{
			
			line.graphics.lineStyle(2, 0x990000, .75);
			line.graphics.beginFill(0x00FF00);
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			var centerX:Number = (x1 + x2)/2;
			var centerY:Number = (y1 + y2)/2;
			line.graphics.moveTo(-dx/2, -dy/2);
			line.graphics.lineTo(dx/2, dy/2);
			line.x = centerX;
			line.y = centerY;
			line.rotation = angle;
			addChild(line);
		}
	
		private function drawCircle(x:Number,y:Number,r:Number):void
		{
//			trace(arguments)
//			tf.appendText("\ndrawCircle " + arguments.toString());
			var circle:Sprite = new Sprite();
			circle.graphics.beginFill(0xFF794B);
			circle.graphics.drawCircle(x, y, r>0?r:0);
			circle.graphics.endFill();
			addChild(circle);
		}
		
		private function getLength(x1:Number, y1:Number, x2:Number, y2:Number):Number{
			return Math.sqrt(Math.pow(x2-x1,2) + Math.pow(y2-y1,2));
		}
		
		private function generateCircles(x1:Number, y1:Number, x2:Number, y2:Number, width:Number):Array {
			var length:Number = getLength(x1,y1,x2,y2);
			var steps:Number = 130;
			var curX:Number = x1;
			var curY:Number = y1;
			var curR:Number = RADIUS_MIN;
			var dx:Number = x2-x1-RADIUS_MIN*2;
			var dy:Number = y2-y1;
			var dr:Number = RADIUS - RADIUS_MIN;
			var lenghtFromCenter:Number;
			
			var maxLenghtFromCenter:Number = length/2 - RADIUS_MIN;
			var centerX:Number = x1 + (x2-x1)/2;
			var centerY:Number = y1 + (y2-y1)/2;
			
			for(var i:Number = 0; i<steps; i++){
				if (x1==x2){
					curY = y1 +i*(y2-y1)/steps;
					curX = (y2*x1-y1*x2-(x1-x2)*curY)/(y2-y1);
				}else{
					curX = x1 +i*(x2-x1)/steps;
					curY = (x2*y1-x1*y2-(y1-y2)*curX)/(x2-x1);
				}

				
				lenghtFromCenter = getLength(curX,curY,centerX,centerY);
				curR = Math.sqrt(1-Math.pow(lenghtFromCenter,2)/Math.pow(length/2,2))*RADIUS;
				
//				if (curR<(length/2-lenghtFromCenter))
					drawCircle(curX,curY,curR);
//				else
//					curR=(length/2-lenghtFromCenter);
			}

			return [];
		}
	}
}
